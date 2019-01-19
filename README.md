Takeaway Challenge
==================
 ```
                         (c)___c____(c)
                            \ ........../
                             |.........|
                              |..M.A..|
                              |.......|
                              |=======|
                              |=======|
                             __o)""""::?
                            C__    c)::;
                               >--   ::     
                               (____/      
                               } /""|      
                    __/       (|V ^ )\     
                    o | _____/ |#/ / |     
           @        o_|}|_____/|/ /  |     
                          _____/ /   |     
              ======ooo}{|______)#   |     
          ~~~~ ;    ;          ###---|8    
        ____;_____;____        ###====     
       (///0///@///@///)       ###@@@@|
       |~~~~~~~~~~~~~~~|       ###@@@@|
        \             /        ###@@@@|               
         \___________/         ###xxxxx      
           H H   H  H          ###|| |    
           H H   H  H           | || |     
           H H   H  H           C |C |    
           H H   H  H            || ||    
           H(o) (o) H            || ::   
          (o)      (o)        Ccc__)__)  

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ```

Setup
-------

* Fork or clone this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems

Usage
-------

To use this, after you've installed the necessary gems, open IRB...

```
2.5.0 :001 > require './lib/takeaway'
 => true
2.5.0 :002 > takeaway = Takeaway.new
2.5.0 :003 > takeaway.read_menu
 => {"Thing1"=>10, "Thing2"=>12, "Thing3"=>15, "Thing4"=>8}
 2.5.0 :004 > takeaway.order("Thing1")
 => "1x Thing1(s) added to basket"
 2.5.0 :005 > takeaway.basket_summary
 => "Thing1 x 1 = £10"
2.5.0 :006 > takeaway.total
 => 10
2.5.0 :007 > takeaway.checkout(10)
```
**Note**

The checkout process will attempt to send a text message using Twilio and throw an error as it won't find any details to authenticate. To do this successfully, please sign up to Twilio and use the `dotenv` gem to add your authentication details and add them to `text.rb`.


User Stories
-----
Here are the user stories this program solves for:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.


