# Bank tech test
Today, you'll practice doing a tech test.
For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.
You'll get to practice your OO design and TDD skills.
You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria
**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

### Installation
From the command line, clone this repository to your machine:
```
git clone https://github.com/zidehen/bank-tech-test.git
```
Once cloned, run these commands to install dependencies:
```
cd bank-tech-test
bundle install
```

### Testing
* Run tests using `rspec`
* Test coverage shown with `simplecov`

## Running the App

```
ZoeOluyomi@Zoes-MacBook-Pro bank-tech-test % irb
3.0.0 :001 > require './lib/account.rb'
 => true 
3.0.0 :002 > transaction = Transaction.new
 => #<Transaction:0x00007fde2c290b28 @balance=0, @credit=0, @date="02/02/2022", @debit=0, @transactions=[]> 
3.0.0 :003 > statement = Statement.new
 => #<Statement:0x00007fde2c26a518> 
3.0.0 :004 > account = Account.new(transaction, statement)
 => 
#<Account:0x00007fde2f89bf10
... 
3.0.0 :005 > account.deposit(250)
 => [{:date=>"02/02/2022", :credit=>"250.00", :debit=>"", :balance=>"250.00"}] 
3.0.0 :006 > account.deposit(200)
 => [{:date=>"02/02/2022", :credit=>"250.00", :debit=>"", :balance=>"250.00"}, {:date=>"02/02/2022", :credit=>"200.00", :debit=>"", :balance=>"450.00"}] 
3.0.0 :007 > account.withdraw(100)
 => 
[{:date=>"02/02/2022", :credit=>"250.00", :debit=>"", :balance=>"250.00"},
 {:date=>"02/02/2022", :credit=>"200.00", :debit=>"", :balance=>"450.00"},
 {:date=>"02/02/2022", :credit=>"", :debit=>"100.00", :balance=>"350.00"}] 
3.0.0 :008 > account.print_statement
date || credit || debit || balance
02/02/2022 ||  || 100.00 || 350.00                              
02/02/2022 || 200.00 ||  || 450.00                              
02/02/2022 || 250.00 ||  || 250.00                              
 =>                                                             
[{:date=>"02/02/2022", :credit=>"", :debit=>"100.00", :balance=>"350.00"},
 {:date=>"02/02/2022", :credit=>"200.00", :debit=>"", :balance=>"450.00"},
 {:date=>"02/02/2022", :credit=>"250.00", :debit=>"", :balance=>"250.00"}] 
```

## My Process
* Translated the requirements of the task down into user stories (see below)
* Tried to plan my approach with domain model diagramming
* Used feature tests in IRB and TDD for each user story

## User Stories

```
As a client
So that I can manage my money
I would like to have a bank account

As a client
So that I can see how much money I have in my account
I would like to see my bank balance

As a client
So that I can add money to my bank account
I want to be able to deposit money into my bank account

As a client
So that I take money out of my account
I want to be able to withdraw money from my bank account

As a client
So that I can see my account history with the date, amount and balance of each transaction
I want to print my bank statement

As a client
So that I can see the most recent transactions first
I want the transactions to be listed in reverse chronological order
```
