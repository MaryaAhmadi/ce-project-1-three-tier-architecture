


# Project Architecture

## Overview
This project implements a three-tier architecture on AWS designed to demonstrate secure, scalable, and highly available cloud infrastructure. The environment separates the presentation, application, and data layers following AWS best practices.

## Presentation Layer
The presentation layer uses an internet-facing Application Load Balancer (ALB) deployed across two Availability Zones. It listens on HTTP port 80 and distributes incoming traffic to healthy application instances.

## Application Layer
The application tier consists of three EC2 instances running Apache web servers. These instances are deployed in private subnets across two Availability Zones and registered with the ALB target group. Each instance exposes a `/health` endpoint used by the load balancer.

## Data Layer
The data tier is hosted in isolated private subnets. The database is only accessible from the application tier, ensuring proper network isolation and security.

## Network Design
The VPC uses a /16 CIDR block and is divided into six subnets across two Availability Zones:

- 2 public subnets for the presentation tier  
- 2 private subnets for the application tier  
- 2 private subnets for the data tier  

An Internet Gateway provides public access, while a NAT Gateway enables outbound internet access for private resources.

## High Availability
High availability is achieved by distributing resources across multiple Availability Zones and configuring health checks on the load balancer.

