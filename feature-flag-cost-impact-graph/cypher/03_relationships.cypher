MATCH (ff:FeatureFlag {name:'FF_EXPRESS_CHECKOUT'}),
      (f:Feature {name:'ExpressCheckout'}),
      (s:Service {name:'CheckoutService'}),
      (r1:CloudResource {name:'EC2_Checkout'}),
      (r2:CloudResource {name:'Redis_Cache'}),
      (e:Environment {name:'prod'})
CREATE
  (ff)-[:ENABLES]->(f),
  (f)-[:IMPACTS]->(s),
  (s)-[:USES]->(r1),
  (s)-[:USES]->(r2),
  (s)-[:DEPLOYED_IN]->(e);
