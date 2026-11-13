# NovaBank Distributed Database Architecture

## 1. Overview

The NovaBank Digital Banking System requires a database architecture that supports availability, data consistency, scalability and reliable access to customer and transaction records.

For this exercise, MongoDB Atlas was used to deploy the NoSQL database in a cloud environment. The deployment provides a practical example of how a distributed database service can support the banking application.

## 2. Cloud Database Deployment

The NovaBank NoSQL database was deployed using MongoDB Atlas with the following configuration:

| Component | Configuration |
|---|---|
| Cloud provider | Amazon Web Services (AWS) |
| Cloud region | Paris, France (eu-west-3) |
| Cluster name | NovaBankCluster |
| MongoDB version | 8.0.37 |
| Deployment type | Replica Set |
| Number of nodes | 3 |
| Database | novabank_nosql |

The deployment uses MongoDB Atlas as a managed cloud database service, reducing the need to manually maintain database servers.

## 3. Database Replication

The cluster is configured as a three-node replica set.

In a MongoDB replica set, one node acts as the primary while the other nodes maintain copies of the data as secondary members.

- **Primary node:** Handles database write operations and coordinates replication.
- **Secondary nodes:** Maintain replicated copies of the primary's data and can serve eligible read operations depending on read preference settings.
- **Automatic failover:** If the primary becomes unavailable, eligible secondary members can participate in an election to select a new primary.

This architecture improves database availability and reduces dependence on a single database server.

The three-node deployment was observed in Atlas. A manual failover test was not performed.

## 4. Data Consistency

MongoDB supports configurable write concern and read preference settings.

For NovaBank, financial transactions should use appropriate write concern settings to ensure that important writes are acknowledged by the required replica-set members.

The application should also use suitable read settings to avoid relying on potentially stale secondary data for critical account balance checks.

Replication provides copies of data across nodes, while the configured consistency controls determine how writes are acknowledged and reads are served.

## 5. Sharding and Scalability

As NovaBank expands its customer base and transaction volume, a single replica set may eventually reach its capacity limits.

MongoDB sharding provides a way to distribute data across multiple database shards.

A possible sharding strategy for NovaBank would use `customer_id` as a candidate shard key for customer-related records, subject to workload analysis and distribution testing.

Sharding could help distribute storage and query workloads across multiple servers.

Sharding was discussed as a proposed scaling approach; it was not configured in this exercise.

## 6. Availability and Disaster Recovery

The three-node replica-set configuration provides redundancy and supports automatic primary election when a primary node becomes unavailable.

For a production banking environment, additional controls would include:

- Regular automated backups.
- Periodic restoration testing.
- Monitoring of replica-set health.
- Access control and encryption.
- Documented disaster recovery procedures.

These measures would support recovery from accidental deletion, infrastructure failure and other operational incidents.

## 7. Conclusion

The NovaBank cloud database exercise demonstrated how MongoDB Atlas provides a managed database deployment with a three-node replica-set architecture.

The exercise also examined replication, availability, consistency and sharding as important considerations when designing distributed database systems for a growing digital banking platform.