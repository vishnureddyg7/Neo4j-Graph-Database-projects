CREATE (:FeatureFlag {name:'FF_EXPRESS_CHECKOUT', status:'OFF'});
CREATE (:Feature {name:'ExpressCheckout'});
CREATE (:Service {name:'CheckoutService'});
CREATE (:CloudResource {name:'EC2_Checkout', type:'EC2', monthly_cost:120});
CREATE (:CloudResource {name:'Redis_Cache', type:'Redis', monthly_cost:40});
CREATE (:Environment {name:'prod'});
