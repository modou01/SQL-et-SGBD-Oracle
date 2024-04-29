-- Vue ALL_WORKERS
CREATE OR REPLACE VIEW ALL_WORKERS AS
SELECT worker_id AS id, first_name, last_name, age, start_date
FROM WORKERS_FACTORY_1
UNION ALL
SELECT worker_id, first_name, last_name, age, start_date
FROM WORKERS_FACTORY_2
ORDER BY start_date DESC;

-- Vue ALL_WORKERS_ELAPSED
CREATE OR REPLACE VIEW ALL_WORKERS_ELAPSED AS
SELECT first_name, last_name, age, SYSDATE - start_date AS days_elapsed
FROM ALL_WORKERS;

-- Vue BEST_SUPPLIERS
CREATE OR REPLACE VIEW BEST_SUPPLIERS AS
SELECT supplier_id, name, SUM(quantity) AS total_pieces
FROM SUPPLIERS_BRING_TO_FACTORY_1
GROUP BY supplier_id, name
HAVING SUM(quantity) > 1000
ORDER BY total_pieces DESC;

-- Vue ROBOTS_FACTORIES
CREATE OR REPLACE VIEW ROBOTS_FACTORIES AS
SELECT r.id AS robot_id, f.main_location, f.id AS factory_id
FROM ROBOTS r
JOIN ROBOTS_FROM_FACTORY rf ON r.id = rf.robot_id
JOIN FACTORIES f ON rf.factory_id = f.id;
