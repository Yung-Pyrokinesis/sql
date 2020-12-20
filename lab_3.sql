CREATE DATABASE supply_department;

CREATE TABLE warehouses ( 
    id INT NOT NULL , 
    PRIMARY KEY (id)
    FOREIGN KEY (id) REFERENCES employees(id_warehouses) ON DELETE CASCADE
    FOREIGN KEY (id) REFERENCES data_of_transfer(id) ON DELETE CASCADE
    FOREIGN KEY (id) REFERENCES data_of_receipt(id) ON DELETE CASCADE
);

CREATE TABLE employees ( 
    id INT NOT NULL , 
    name TEXT NOT NULL , 
    surname TEXT NOT NULL , 
    tax_number INT NOT NULL , 
    id_warehouses INT NOT NULL , 
    position TEXT NOT NULL , 
    PRIMARY KEY (id), 
    UNIQUE (tax_number),
);

CREATE TABLE data_of_transfer ( 
    id INT NOT NULL , 
    id_contract INT NOT NULL , 
    date DATE NOT NULL , 
    PRIMARY KEY (id),
    UNIQUE (id_contract),
);

CREATE TABLE data_of_receipt ( 
    id INT NOT NULL , 
    id_contract INT NOT NULL , 
    date DATE NOT NULL , 
    PRIMARY KEY (id),
    UNIQUE (id_contract),
    FOREIGN KEY (id_contract) REFERENCES data_of_transfer(id_settelement) ON DELETE CASCADE
);

CREATE TABLE settelment ( 
    id INT NOT NULL , 
    price INT NOT NULL , 
    id_provider INT NOT NULL , 
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES data_of_receipt(id_settelement) ON DELETE CASCADE
);

CREATE TABLE provider ( 
    id INT NOT NULL , 
    id_contract INT NOT NULL ,
    name TEXT NOT NULL , 
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES settelment(id_provider) ON DELETE CASCADE
);

CREATE TABLE contract ( 
    id INT NOT NULL , 
    name TEXT NOT NULL , 
    raw_or_materials TEXT NOT NULL , 
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES provider(id_contract) ON DELETE CASCADE
);