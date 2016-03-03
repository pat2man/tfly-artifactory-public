If you take a look at the `.kitchen.yaml` file, you'll see something that looks like this:


```
provisioner:
  name: chef_zero
  # Local 
  data_bags_path: "./kitchen/data_bags"
```


What this does is set up everything inside of the `./kitchen/data_bags` folder as an actual data bag that the `chef_zero` provider will use.


An example has been provided for a mock/dummy tdly-deploy user's SSH keys.

This is how you can set up mock data bags and nodes in local kitchen runs.
