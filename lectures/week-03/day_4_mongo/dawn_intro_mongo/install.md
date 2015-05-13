# Setup

| Objectives |
| :--- |
| Setup a database and model to perform CRUD operations |
| Utilize the **Express** application framework to create a CRUD application |
| Review and apply JavaScript fundamentals |



## Installing!?!?!

### [Node Install](https://nodejs.org/)

Go to [https://nodejs.org/](https://nodejs.org/) and click the install button.

![images/node_site.png](images/node_site.png)

### [Install Brew](http://brew.sh/)

One of the tools we're going to need today is called Homebrew. We can use it to quickly install other libraries that we'll need.

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```


### [Database Install](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-os-x/)

To get started today we are going to want to install a database to store all of our data. To save us time we are going use a database called MongoDB. 


* First take a deep breath and relax. Installing things is tricky, but you'll be fine.
* First we'll need to run brew update to update our brew packages.

  ```bash
  brew update
  ```
* Next we'll neet to run `brew instal` for **MongoDB**

  ```bash
  brew install mongodb
  ```

* Next we'll need a directory for **MongoDB** to save data.

  ```bash
  sudo mkdir -p /data/db
  ```

  * Next we'll want to make sure we have permission to read and write to this directory.

  ```bash
  sudo chown -R $USER /data/db
  ```

  

