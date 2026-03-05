from db import Neo4jDB

def get_feature_cost_impact(flag_name):
    query = """
    MATCH (ff:FeatureFlag {name: $flag})
          -[:ENABLES]->(:Feature)
          -[:IMPACTS]->(s:Service)
          -[:USES]->(r:CloudResource)
    RETURN 
        s.name AS service,
        r.name AS resource,
        r.type AS type,
        r.monthly_cost AS monthly_cost
    """

    db = Neo4jDB()
    try:
        with db.driver.session() as session:
            result = session.run(query, flag=flag_name)
            return result.data()
    finally:
        db.close()


if __name__ == "__main__":
    data = get_feature_cost_impact("FF_EXPRESS_CHECKOUT")
    total_cost = 0

    print("Feature Cost Impact:\n")
    for row in data:
        print(row)
        total_cost += row["monthly_cost"]

    print(f"\nTotal Monthly Cost Impact: ${total_cost}")
