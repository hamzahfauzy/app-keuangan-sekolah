CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE role_routes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role_id INT NOT NULL,
    route_path VARCHAR(100) NOT NULL,
    CONSTRAINT fk_role_routes_role_id FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);

CREATE TABLE accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    parent_id INT NULL,
    code VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    transaction_type VARCHAR(100) NOT NULL
);

CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    subject_id INT NULL,
    bill_id INT NULL,
    user_id INT NULL,
    user_name VARCHAR(100) NULL,
    description TEXT NULL,
    amount VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_transactions_account_id FOREIGN KEY (account_id) REFERENCES accounts(id) ON DELETE CASCADE
);

CREATE TABLE subjects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    special_id VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    subject_type VARCHAR(45) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    subject_id INT NOT NULL,
    account_id INT NOT NULL,
    user_id INT NULL,
    user_name VARCHAR(100) NULL,
    name VARCHAR(100) NOT NULL,
    amount VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE application (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    phone VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO roles (id, name) VALUES (1, 'Bendahara');
INSERT INTO roles (id, name) VALUES (2, 'Dosen');
INSERT INTO roles (id, name) VALUES (3, 'Mahasiswa');
INSERT INTO roles (id, name) VALUES (4, 'Back Office');
INSERT INTO roles (id, name) VALUES (5, 'Master');
INSERT INTO roles (id, name) VALUES (6, 'Kasir');

INSERT INTO role_routes (role_id,route_path) VALUE (1,'default/index');
INSERT INTO role_routes (role_id,route_path) VALUE (1,'accounts/*');
INSERT INTO role_routes (role_id,route_path) VALUE (1,'transactions/*');
INSERT INTO role_routes (role_id,route_path) VALUE (1,'subjects/*');
INSERT INTO role_routes (role_id,route_path) VALUE (1,'bills/*');
INSERT INTO role_routes (role_id,route_path) VALUE (1,'reports/*');

INSERT INTO role_routes (role_id,route_path) VALUE (2,'default/index');
INSERT INTO role_routes (role_id,route_path) VALUE (3,'default/index');
INSERT INTO role_routes (role_id,route_path) VALUE (5,'*');
INSERT INTO role_routes (role_id,route_path) VALUE (6,'transactions/*');

INSERT INTO application (name, address, phone, email) VALUES ('Keuangan','STIKES Assyifa','0','0');

INSERT INTO accounts(code,name,transaction_type) VALUES ('1-001','Uang Kuliah','Db');
INSERT INTO accounts(code,name,transaction_type) VALUES ('1-002','Upah Staff / Dosen','Cr');