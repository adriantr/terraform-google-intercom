### Terraform Google Intercom module
This is basically a module that will set up SSL for you help domain, and is the GCPs alternative to following Intercom [setup](https://developers.intercom.com/installing-intercom/docs/set-up-your-custom-domain?showHidden=f2cb6).

The module sets up a Classic HTTPS load balancer with Google Managed SSL certificate that points to the domain you've chosed as `dns_name` variable. 
