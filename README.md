# AWS S3 Bucket with Terraform

## Overview

This project demonstrates how to provision and manage a secure AWS S3 bucket using Terraform.

The infrastructure is defined as code and managed through Git and GitHub.

## Architecture

Terraform → AWS Provider → Amazon S3

## Technologies Used

- AWS S3
- Terraform
- AWS CLI
- Git
- GitHub
- Linux

## Infrastructure

The project provisions an S3 bucket with:

- S3 Versioning enabled
- Server-side encryption using AES256
- S3 Block Public Access enabled
- Resource tags
- Terraform variables
- Terraform outputs

## Project Structure
.
├── main.tf
├── variables.tf
├── outputs.tf
├── .gitignore
├── .terraform.lock.hcl
└── README.md
