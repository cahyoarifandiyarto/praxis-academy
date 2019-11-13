import 'dart:io';

void main() {
    int select = 0;
    int choice = 0;

    select = 0;
    choice = 0;

    print("=====");
    print("\tWelcome to this simple ATM machine");
    print("=====");

    do {
      do {
        print("Please select ATM Transactions");
        print("Press [1] Deposit");
        print("Press [2] Withdraw");
        print("Press [3] Balance Inquiry");
        print("Press [4] Exit");

        stdout.write("What would you like to do?");
        select = int.parse(stdin.readLineSync());

        if(select > 4) {
          print("Please select correct transactions");
        } else {
          switch(select) {
            case 1:
              print("Enter the amount of money to deposit");
              Deposit.deposit = int.parse(stdin.readLineSync());
              BalanceInquiry.balance = Deposit.deposit + BalanceInquiry.balance;
              ATMMachine.depositMoney();
              break;

            case 2:
              print("To withdraw, make sure that you have sufficient balance in your account");
              stdout.write("Enter amount of money to withdraw");
              Withdraw.withdraw = int.parse(stdin.readLineSync());
              ATMMachine.withdrawMoney();
              break;

            case 3:
              ATMMachine.checkBalance();
              break;

            default:
              print("Transaction exited");
              break;
          }
        }
      } while(select > 4);

      do {
        print("Would you like to try another transaction?");
        print("Press [1] Yes Press [2] No");
        stdout.write("Enter choice: ");
        choice = int.parse(stdin.readLineSync());
      } while(choice > 2);
    } while(choice <= 1);
  }

class ATMMachine {
  static void checkBalance() {
    print("\tYour current balance is " + BalanceInquiry.getBalance().toString());
  }

  static void withdrawMoney() {
    if(BalanceInquiry.balance == 0) {
      print("\tYour current balance is zero.");
      print("\tYou cannot withdraw!");
      print("\tYou need to deposit money first");
    } else if(BalanceInquiry.balance <= 500) {
      print("\tYou do not have sufficient money to withdraw");
      print("\tYou cannot withdraw!");
      print("\tYou need to deposit money first");
    } else if(Withdraw.withdraw > BalanceInquiry.balance) {
      print("\tThe amount you withdraw is greater than to your balance");
      print("\tPlease check the amount you entered");
    } else {
      BalanceInquiry.balance = BalanceInquiry.balance - Withdraw.withdraw;
      print("\n\tYou withdraw the amount of Php " + Withdraw.withdraw.toString());
    }
  }

  static void depositMoney() {
    print("\tYou deposited the amount of " + Deposit.getDeposit().toString());
  }

}

class Deposit extends ATMMachine {
  static int deposit;

  void setDeposit(int d) {
    deposit = d;
  }

  static int getDeposit() {
    return deposit;
  }
}

class Withdraw extends ATMMachine {
  static int withdraw = 0;

  void setWithdraw(int w) {
    withdraw = w;
  }

  static int getWithdraw() {
    return withdraw;
  }
}

class BalanceInquiry extends ATMMachine {
  static int balance = 0;

  void setBalance(int b) {
    balance = b;
  }

  static int getBalance() {
    return balance;
  }
}