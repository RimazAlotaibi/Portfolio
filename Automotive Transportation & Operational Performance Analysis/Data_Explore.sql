
USE AutoTransport;
GO

-- Explore Transport Orders
SELECT TOP 10 *
FROM transport_orders;

-- Explore Deliveries
SELECT TOP 10 *
FROM deliveries;

-- Explore Carriers
SELECT *
FROM carriers;

-- Explore Vehicles
SELECT TOP 10 *
FROM vehicles;

-- Explore Warehouses
SELECT *
FROM warehouses;

-- Explore Transport Events
SELECT TOP 10 *
FROM transport_events;

-- Explore Carrier Assignments
SELECT TOP 10 *
FROM carrier_assignments;

-- Explore Carrier Service Targets
SELECT *
FROM carrier_service_targets;



SELECT
    status,
    COUNT(*) AS TotalOrders
FROM transport_orders
GROUP BY status;




SELECT
    route_class,
    COUNT(*) AS TotalOrders
FROM transport_orders
GROUP BY route_class
ORDER BY TotalOrders DESC;



-- Destination Cities
SELECT
    destination_city,
    COUNT(*) AS TotalOrders
FROM transport_orders
GROUP BY destination_city
ORDER BY TotalOrders DESC;

-- Congestion Levels
SELECT
    congestion_level,
    COUNT(*) AS TotalOrders
FROM transport_orders
GROUP BY congestion_level;

-- Shipment Priority
SELECT
    priority,
    COUNT(*) AS TotalOrders
FROM transport_orders
GROUP BY priority;




SELECT
    c.carrier_name,
    COUNT(o.order_id) AS TotalOrders
FROM carriers c
LEFT JOIN transport_orders o
    ON c.carrier_id = o.carrier_id
GROUP BY c.carrier_name
ORDER BY TotalOrders DESC;




SELECT
    response_status,
    COUNT(*) AS TotalAssignments
FROM carrier_assignments
GROUP BY response_status;




SELECT
    MIN(actual_dispatch_at) AS FirstDispatch,
    MAX(actual_dispatch_at) AS LastDispatch
FROM transport_orders;

SELECT
    MIN(delivered_at) AS FirstDelivery,
    MAX(delivered_at) AS LastDelivery
FROM deliveries;


