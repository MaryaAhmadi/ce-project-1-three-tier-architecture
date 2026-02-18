


# Security Configuration

## Security Approach
Security in this architecture follows the principle of least privilege. Each tier has its own security group with tightly controlled access rules.

## Load Balancer Security Group
The ALB security group allows inbound HTTP traffic from the internet (0.0.0.0/0). This is the only public entry point into the system.

## Application Tier Security Group
Application instances only accept traffic from the ALB security group on port 80. Direct internet access to the application tier is blocked.

## Data Tier Security Group
The database layer only allows MySQL traffic (port 3306) from the application security group. This ensures the database is fully isolated from public access.

## Network Isolation
Private subnets do not have direct internet access. Outbound connectivity is provided through a NAT Gateway when required.

## Best Practices Applied
- Principle of least privilege  
- Tier-based security groups  
- No public access to private tiers  
- Health checks restricted within the VPC

