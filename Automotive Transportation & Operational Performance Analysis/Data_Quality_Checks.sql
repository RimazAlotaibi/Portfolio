
SELECT
    COUNT(*) AS TotalOrders,
    SUM(CASE WHEN carrier_id IS NULL THEN 1 ELSE 0 END)
        AS MissingCarrier,
    SUM(CASE WHEN vehicle_id IS NULL THEN 1 ELSE 0 END)
        AS MissingVehicle,
    SUM(CASE WHEN promised_delivery_at IS NULL THEN 1 ELSE 0 END)
        AS MissingDeliveryDate
FROM transport_orders;



SELECT
    order_id,
    COUNT(*) AS Total
FROM transport_orders
GROUP BY order_id
HAVING COUNT(*) > 1;



SELECT *
FROM carrier_assignments
WHERE responded_at < requested_at;
