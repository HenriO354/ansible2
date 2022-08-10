variable "proxmox_api_url" {
    type        = string
    description = "Proxmox api url"
}

variable "proxmox_api_token_id" {
    type      = string
    description = "Proxmox api token ID"
}

variable "proxmox_api_token_secret" {
    type        = string
    sensitive   = true
    description = "Proxmox api token secret"
}

variable "proxmox_node" {
    type        = string
    description = "Proxmox node name"
    default     = "pve1"
}

# Resource Definition for the VM Template
source "proxmox-iso" "ubuntu-jammy" {
 
    # Proxmox Connection Settings
    proxmox_url = "${var.proxmox_api_url}"
    username = "${var.proxmox_api_token_id}"
    token = "${var.proxmox_api_token_secret}"
    
    # VM General Settings
    node = "${var.proxmox_node}"
    # vm_id = "102"
    vm_name = "ubuntu-jammy"
    template_description = "Ubuntu Server jammy Image"

    # VM OS Settings
    iso_file = "local:iso/ubuntu-22.04-live-server-amd64.iso"
    iso_storage_pool = "local"
    unmount_iso = true
    task_timeout = "10m"
    os = "l26"

    # VM System Settings
    qemu_agent = true

    # VM Hard Disk Settings
    scsi_controller = "virtio-scsi-pci"

    disks {
        disk_size = "20G"
        # format = "qcow2"
        storage_pool = "local-lvm"
        storage_pool_type = "lvm"
        type = "scsi"
    }

    # VM CPU Settings
    cores = "1"
    
    # VM Memory Settings
    memory = "2048" 

    # VM Network Settings
    network_adapters {
        model = "virtio"
        bridge = "vmbr0"
        firewall = "false"
    } 

    # VM Cloud-Init Settings
    cloud_init = true
    cloud_init_storage_pool = "local-lvm"

    # PACKER Boot Commands
    boot_wait = "5s"
    boot_command = [
        "c<wait>",
        "linux /casper/vmlinuz --- autoinstall ds=\"nocloud-net;seedfrom=http://{{.HTTPIP}}:{{.HTTPPort}}/\"",
        "<enter><wait>",
        "initrd /casper/initrd",
        "<enter><wait>",
        "boot",
        "<enter>"
    ]

    # PACKER Autoinstall Settings
    http_directory = "http" 
    # (Optional) Bind IP Address and Port
    http_bind_address = "0.0.0.0"
    http_port_min = 8802
    http_port_max = 8802

    ssh_username = "proxmox"

    # (Option 1) Add your Password here
    # ssh_password = "your-password"
    # - or -
    # (Option 2) Add your Private SSH KEY file here
    ssh_private_key_file = "~/.ssh/ansible"

    # Raise the timeout, when installation takes longer
    ssh_timeout = "10m"
}

# Build Definition to create the VM Template
build {

    name = "ubuntu-jammy"
    sources = ["source.proxmox-iso.ubuntu-jammy"]

    # Provisioning the VM Template for Cloud-Init Integration in Proxmox #1
    provisioner "shell" {
        inline = [
            "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done",
            "sudo rm /etc/ssh/ssh_host_*",
            "sudo truncate -s 0 /etc/machine-id",
            "sudo apt -y autoremove --purge",
            "sudo apt -y clean",
            "sudo apt -y autoclean",
            "sudo cloud-init clean"
        ]
    }
}