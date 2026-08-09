import dlt

employees = [
    {
        "employee_id": 1,
        "name": "Rawdha",
        "department": "DWH",
    },
    {
        "employee_id": 2,
        "name": "Test User",
        "department": "Data Engineering",
    },
]

pipeline = dlt.pipeline(
    pipeline_name="dlt_postgres_test",
    destination="postgres",
    dataset_name="dlt_demo",
)

load_info = pipeline.run(
    employees,
    table_name="employees",
    write_disposition="replace",
)

print(load_info)