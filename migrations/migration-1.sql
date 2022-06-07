INSERT INTO role_routes (role_id,route_path) VALUE (1,'sources/*');
INSERT INTO role_routes (role_id,route_path) VALUE (1,'years/*');
INSERT INTO role_routes (role_id,route_path) VALUE (1,'activities/*');
INSERT INTO role_routes (role_id,route_path) VALUE (1,'budgets/*');
INSERT INTO role_routes (role_id,route_path) VALUE (1,'budget-items/*');

ALTER TABLE subjects ADD COLUMN subject_group VARCHAR(45) DEFAULT NULL;

CREATE TABLE sources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    priority INT DEFAULT 0,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE activities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    parent_id INT DEFAULT NULL,
    code VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE years (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    status INT DEFAULT 0,
    budget INT DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE budget_years (
    id INT AUTO_INCREMENT PRIMARY KEY,
    year_id INT NOT NULL,
    source_id INT NOT NULL,
    amount VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_budget_years_year_id FOREIGN KEY (year_id) REFERENCES years(id) ON DELETE CASCADE,
    CONSTRAINT fk_budget_years_source_id FOREIGN KEY (source_id) REFERENCES sources(id) ON DELETE CASCADE
);

CREATE TABLE budgets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    year_id INT NOT NULL,
    activity_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_budgets_year_id FOREIGN KEY (year_id) REFERENCES years(id) ON DELETE CASCADE,
    CONSTRAINT fk_budgets_activity_id FOREIGN KEY (activity_id) REFERENCES activities(id) ON DELETE CASCADE
);

CREATE TABLE budget_sources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    budget_id INT NOT NULL,
    source_id INT NOT NULL,
    amount VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_budget_sources_budget_id FOREIGN KEY (budget_id) REFERENCES budgets(id) ON DELETE CASCADE,
    CONSTRAINT fk_budget_sources_source_id FOREIGN KEY (source_id) REFERENCES sources(id) ON DELETE CASCADE
);

CREATE TABLE budget_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    budget_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    amount VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_budget_items_budget_id FOREIGN KEY (budget_id) REFERENCES budgets(id) ON DELETE CASCADE
);