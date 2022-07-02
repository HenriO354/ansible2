# Proxmox

## Introduction

Create, delete and stop Qemu (KVM) Virtual Machines in Proxmox VE using ansible module called proxmox_kvm.

## Requirements

- Ansible Host:

    - Community-general Collection package via ansible-galaxy
    - Proxmoxer package via pip
    - requests package via pip

- Proxmox Host (node):

    - proxmoxer
