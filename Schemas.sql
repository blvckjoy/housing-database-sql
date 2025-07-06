--CREATE THE SCHEMAS

DROP TABLE IF EXISTS houses;
GO
DROP TABLE IF EXISTS neighborhoods;
GO
DROP TABLE IF EXISTS agents;
GO
DROP TABLE IF EXISTS sales;
GO


CREATE TABLE houses
(
    house_id VARCHAR(10) PRIMARY KEY,
    neighborhood_id VARCHAR(10),
    address VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(20),
    zip_code VARCHAR(10),
    price DECIMAL(12,2),
    bedrooms INT,
    bathrooms DECIMAL(3,1),
    sqft INT,
    year_built INT,
    lot_size DECIMAL(6,2),
    garage INT,
    style VARCHAR(30),
    hoa_fee DECIMAL(8,2),
    status VARCHAR(15),
    CONSTRAINT fk_neighborhood FOREIGN KEY (neighborhood_id) REFERENCES neighborhoods(neighborhood_id)
);

CREATE TABLE neighborhoods
(
    neighborhood_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    avg_income DECIMAL(12,2),
    school_rating DECIMAL(3,2),
    walk_score INT
);

ALTER TABLE neighborhoods
ALTER COLUMN school_rating DECIMAL(2,1);

CREATE TABLE agents
(
    agent_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(50),
    license_no VARCHAR(20),
    office VARCHAR(50),
    years_exp INT
);

CREATE TABLE sales
(
    sale_id VARCHAR(10) PRIMARY KEY,
    house_id VARCHAR(10),
    agent_id VARCHAR(10),
    sale_date DATE,
    sale_price DECIMAL(12,2),
    buyer_name VARCHAR(50),
    buyer_email VARCHAR(50),
    CONSTRAINT fk_house FOREIGN KEY (house_id) REFERENCES houses(house_id),
    CONSTRAINT fk_agent FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);