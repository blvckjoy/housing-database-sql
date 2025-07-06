INSERT INTO houses
    (house_id, neighborhood_id, address, city, state, zip_code, price, bedrooms, bathrooms, sqft, year_built, lot_size, garage, style, hoa_fee, status)
VALUES
    ('H101', 'N001', '123 Main St', 'Austin', 'TX', '78701', 350000, 3, 2.0, 1800, 1999, 0.20, 1, 'Ranch', 0, 'Sold'),
    ('H102', 'N002', '456 Oak Ave', 'Dallas', 'TX', '75201', 450000, 4, 2.5, 2200, 2005, 0.15, 1, 'Colonial', 50, 'Listed'),
    ('H103', 'N003', '789 Pine Rd', 'Houston', 'TX', '77001', 300000, 3, 2.0, 1600, 1990, 0.33, 0, 'Bungalow', 0, 'Sold'),
    ('H104', 'N004', '321 Maple Dr', 'Austin', 'TX', '78702', 525000, 5, 4.0, 3000, 2010, 0.50, 1, 'Modern', '100', 'Listed'),
    ('H105', 'N005', '222 Cedar Ct', 'Dallas', 'TX', '75205', 275000, 2, 1.0, 1200, 1985, 0.12, 0, 'Cottage', 0, 'Sold'),
    ('H106', 'N006', '654 Elm St', 'Houston', 'TX', '77002', 600000, 4, 3.5, 2750, 2020, 0.25, 2, 'Contemporary', 120, 'Listed');


INSERT INTO neighborhoods
    (neighborhood_id, name, city, avg_income, school_rating, walk_score)
VALUES
    ('N001', 'Downtown', 'Austin', 85000, 8.5, 95),
    ('N002', 'Uptown', 'Dallas', 95000, 9.0, 88),
    ('N003', 'Midtown', 'Houston', 78000, 7.9, 70),
    ('N004', 'East Side', 'Austin', 67000, 7.5, 80),
    ('N005', 'Lakeview', 'Dallas', 120000, 9.3, 92),
    ('N006', 'South Heights', 'Houston', 62000, 6.7, 65);


INSERT INTO agents
    (agent_id, name, phone, email, license_no, office, years_exp)
VALUES
    ('A1', 'Alice Smith', '555-1234', 'alice@example.com', 'TX123456', 'Austin Realty', 7),
    ('A2', 'Bob Johnson', '555-5678', 'bob@example.com', 'TX654321', 'Dallas Realty', 12),
    ('A3', 'Carlos Lopez', '555-2468', 'carlos@example.com', 'TX789012', 'Houston Homes', 4),
    ('A4', 'Dana Wu', '555-1357', 'dana@example.com', 'TX345678', 'Austin Realty', 9);


INSERT INTO sales
    (sale_id, house_id, agent_id, sale_date, sale_price, buyer_name, buyer_email)
VALUES
    ('S110', 'H101', 'A1', '2024-03-10', 355000, 'Evelyn Carter', 'evelyn.c@example.com'),
    ('S120', 'H103', 'A2', '2024-05-15', 305000, 'Frank Miller', 'frank.m@example.com'),
    ('S130', 'H105', 'A3', '2025-01-22', 279000, 'Grace Yoon', 'grace.y@example.com');