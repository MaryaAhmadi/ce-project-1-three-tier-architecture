# ce-project-1-three-tier-architecture



# Project: 3-Tier Web Application on AWS

## Overview
This project demonstrates a **3-tier web application** running entirely on AWS. The goal was to create a secure, highly available, and load-balanced application with clear separation between the presentation, application, and data layers.

---

## Architecture at a Glance
- **VPC:** 10.0.0.0/16  
- **Subnets:**
  - **Public (Presentation Layer):** Hosts the Application Load Balancer (ALB) across 2 Availability Zones.  
  - **Private (Application Layer):** EC2 instances running the web app, deployed across 2 AZs.  
  - **Private (Data Layer):** Database instances (RDS or simulated DB), only accessible by the application layer.  
- **Internet Gateway:** Provides public internet access to public subnets.  
- **NAT Gateway:** Gives private instances outbound internet access without exposing them publicly.  
- **Routing:** Each subnet has a dedicated route table for proper connectivity and isolation.  
- **Load Balancer:** Internet-facing ALB with HTTP listener and health checks to monitor instance health.  

**Architecture Diagram:**  
![Architecture Diagram](./architecture-diagram.png)

---

## Design Choices & Reasoning
- **Private subnets for EC2 instances** ensure the application layer is not directly exposed to the internet.  
- **ALB instead of a Classic Load Balancer** for better scalability, routing, and health checks.  
- **NAT Gateway** allows software updates and downloads from private instances without compromising security.  
- **Database placement:** RDS (bonus) deployed in isolated subnets, restricted to the application layer to follow least privilege principles.  
- **Trade-offs:** Using RDS adds cost but improves reliability. Without RDS, a simulated DB was used as a placeholder.

---

## Security Highlights
- **Security Groups:**
  - **ALB SG:** Allows HTTP/HTTPS traffic from the public internet.  
  - **App SG:** Accepts HTTP traffic only from ALB SG.  
  - **DB SG:** Accepts database traffic only from App SG.  
- **No direct internet access** to private subnets.  
- **Least privilege principle** applied across all tiers, minimizing attack surface.

---

## Testing & Verification
- **Application instances** respond correctly to `/health` endpoint.  
- **ALB health checks** confirmed working across all instances.  
- Local testing (`curl http://localhost/health`) returned `HTTP/1.1 200 OK`.  
- **Database connectivity** verified only from application instances.  
- Failover scenarios tested within the ALB and multiple AZs.

---

## Cost Overview (Estimated)
| Resource | Quantity | Notes |
|----------|---------|-------|
| EC2 t4g.micro | 3 | Application Layer |
| ALB | 1 | Handles incoming traffic |
| NAT Gateway | 1 | Outbound internet for private subnets |
| RDS db.t4g.micro | 1 | Database (bonus) |

**Estimated Monthly Cost:** $25–$30 (depends on region and usage)

---


## Additional Recommendations & Enhancements

### Should Have (Recommended)
These are features that are highly recommended for production-ready setups:

- **Multi-AZ NAT Gateway:** Ensures high availability for outbound traffic from private subnets.  
- **Auto Scaling Group for Application Tier:** Automatically scales EC2 instances based on load.  
- **RDS Multi-AZ Database:** Provides database redundancy and failover support.  
- **HTTPS Listener with ACM Certificate:** Secures traffic between clients and the ALB.  
- **CloudWatch Alarms:** Monitors system metrics and triggers notifications on thresholds.  
- **Centralized Session Storage (ElastiCache):** Stores session data consistently across instances.  
- **VPC Flow Logs Enabled:** Captures network traffic for security and troubleshooting.  
- **Cost Allocation Tags:** Helps track and manage AWS costs efficiently.



### Nice to Have (Bonus)
These are optional enhancements that add robustness and best-practice features:

- **CI/CD Pipeline for Deployments:** Automates application delivery and reduces human error.  
- **Infrastructure as Code (CloudFormation/Terraform):** Makes infrastructure reproducible and version-controlled.  
- **Blue-Green Deployment Strategy:** Reduces downtime during updates.  
- **Multi-Region Architecture Design:** Improves resilience and latency for global users.  
- **Disaster Recovery Plan:** Defines backup, failover, and recovery strategies.  
- **Monitoring Dashboard (CloudWatch/Grafana):** Provides visual insight into system performance and health.



> **Note:** Most of the recommended features were considered during design, but for the scope of this project, some are planned for future implementation.

---


## Challenges & Solutions


- **Problem 1:** Some EC2 instances failed health checks initially  
  **Solution:** Verified security groups, subnet routing, and corrected health check endpoint  


- **Problem 2:** RDS password policy initially blocked password  
  **Solution:** Updated password to meet MySQL requirements (printable ASCII, no forbidden characters)  

- **Problem 3:** ALB DNS not reachable from CloudShell  
**Solution:** Verified subnets, security groups, and private vs public access  

---

**Lessons Learned / What we would do differently:**  

- Consider enabling multi-AZ for all tiers for higher availability  
- Implement HTTPS and proper certificate management early  
- Automate provisioning via IaC to reduce manual setup





## Final Thoughts
- The project demonstrates **secure, multi-tier architecture** on AWS.  
- Each layer is isolated but fully integrated for end-to-end functionality.  
- Documentation includes diagrams, design decisions, testing notes, and cost analysis.  
- Security and best practices were considered at every step.  

This setup can be used as a foundation for more complex applications, adding autoscaling, multiple databases, or more advanced monitoring as needed.
