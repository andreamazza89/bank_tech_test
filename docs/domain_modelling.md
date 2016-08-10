# Domain modelling

The CRC cards below were created at the very beginning of the project and depict 
the initial thoughts on the desing of the applications. These are based on the 
specification, which can be found [here](https://github.com/makersacademy/course/blob/master/week12/bank_tech_test.md).

For the first iteration, the deposit and withdrawal amounts are allowed to be as
large as the language (Ruby) allows an integer to be. This is unspecified by the
client so the easiest soltion is implemented to then iterate on.

The same argument goes for negative balance: as the client has not specified a 
requirement to limit or not allow negative balance, the first iteration will 
allow a user's balance to become negative, the only limitation being how large an
integer can be in Ruby.

Again, as no spcifics are given on creating a new account, in this iteration a 
new account is instantiated with a balance of 0.

The inuput to the deposit and withdraw methods will be in cents.

## CRC cards

<table>
  <tr>
    <td colspan="2"><b>Account</b></td>
  </tr>
  <tr>
    <td>#deposit(integer pence) positively updates the balance</td>
    <td></td>
  </tr>
  <tr>
    <td>#withdraw(integer pence) negatively updates the balance</td>
    <td></td>
  </tr>
  <tr>
    <td>#statement returns all transactions, including date</td>
    <td></td>
  </tr>
</table>

<table>
  <tr>
    <td colspan="2"><b>Statement printer</b></td>
  </tr>
  <tr>
    <td>#print statement (formatting as per spec)</td>
    <td>Account</td>
  </tr>
</table>
