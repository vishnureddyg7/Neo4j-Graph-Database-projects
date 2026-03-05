// Feature cost
MATCH (ff:FeatureFlag {name:'FF_EXPRESS_CHECKOUT'})
      -[:ENABLES]->(:Feature)
      -[:IMPACTS]->(s)
      -[:USES]->(r)
RETURN ff.name, sum(r.monthly_cost);

// Environment-aware cost
MATCH (ff:FeatureFlag {name:'FF_EXPRESS_CHECKOUT'})
      -[:ENABLES]->(:Feature)
      -[:IMPACTS]->(s)
      -[:DEPLOYED_IN]->(:Environment {name:'prod'}),
      (s)-[:USES]->(r)
RETURN sum(r.prod_cost);
