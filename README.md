# league-manager
A console-based football league manager built with Python and MySQL, made for project in DV1663, BTH

## Requirements
- Python 3.10+
- MySQL Server
-  mysql-connector-python

## Setup
1. Run schema.sql in MySQL Workbench to create the database
2. Run seed.sql to populate with test data
3. Run trigger_query.sql and procedure_query.sql to create the trigger and procedure
4. Install the Python library: pip install mysql-connector-python
5. Copy config.example.py to config.py and enter your MySQL password
6. Run the app: python main.py

## ER Diagram
![ER Diagram](er_graph_dv1663.png)
