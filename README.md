# Cash Register

### Versions and dependencies:

The versions of Ruby and Rails used are Ruby 3.2.2 and Rails 6.1.7. The database used is the one recommended by the Ruby on Rails getting started guide, SQLite3. To install all the dependencies you can follow the above mentioned getting started guide https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails

### Configuration:

Once all the above dependencies are installed you can clone the repository 
```
git clone git@github.com:adrimll97/cash_register.git
```
To set up the database you just need to launch the project migrations, and then the seeds:
```
bin/rails db:migrate
bin/rails db:seed
```
Once this is done, we would have the project installed and we could start the rails server to have the project running:
```
bin/rails s
```
With this we would have the project running and listening on port 3000. Entering to http://localhost:3000/ we can access the application.

![image](https://github.com/adrimll97/cash_register/assets/24661263/3ab036e1-a92f-417e-a799-993a94d6333a)

By clicking in `Add to basket` button, you can add or increase the quantity of the selected product in the basket

![image](https://github.com/adrimll97/cash_register/assets/24661263/a7420778-8e39-4640-b632-5fa8e5b771af)
![image](https://github.com/adrimll97/cash_register/assets/24661263/83be85ba-84c0-46b0-aaeb-010c144a3bdb)

By clicking in `Remove from basket` button, you can remove or decrease the quantity of the selected product in the basket

![image](https://github.com/adrimll97/cash_register/assets/24661263/3ece8fb5-a2ec-41f1-ad15-ddb6b9bc918f)
![image](https://github.com/adrimll97/cash_register/assets/24661263/a1dd13a9-5c4c-45a7-be53-b1da4e55b8ba)

Finally, you can click the `Calculate final price` button to calculate the final price of the basket applying the available promotions

![image](https://github.com/adrimll97/cash_register/assets/24661263/d0a77554-1b06-45e1-a4dd-cd0e0521d731)
![image](https://github.com/adrimll97/cash_register/assets/24661263/a4b24f80-13f8-428d-8419-97b608660e4f)
