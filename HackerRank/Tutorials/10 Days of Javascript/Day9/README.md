# Binary Calculator

## Objective

In this challenge, we implement a calculator that uses binary numbers. Check out the attached tutorial for learning materials.

## Task

Implement a simple calculator that performs the following operations on *binary numbers*: addition, subtraction, multiplication, and division. Note that division operation must be *integer* division only; for example, **1001/100 = 10**, **1110/101 = 10**, and **101/1 = 101**.

The calculator's initial state must look like this:

![alt image](https://s3.amazonaws.com/hr-challenge-images/0/1456642859-ad1191f53b-ScreenShot2016-02-28at12.29.21PM.png)

* *Element IDs. Each element in the document must have an `id`, specified below*:

| `innerHTML` | `id` | Description/Behavior |
|-----|-----|-----|
| | `res` | Contains the result of button presses. |
| | `btns` | A button container that displays all eight calculator buttons. |
| `0` | `btn0` | A button expressing binary digit **0**. |
| `1` | `btn1` | A button expressing binary digit **1**. |
| `C` | `btnClr` | A button to clear the contents of ***res***. |
| `=` | `btnEql` | A button to evaluate the contents of the expression in ***res***. |
| `+` | `btnSum` | A button for the addition operation. |
| `-` | `btnSub` |  A button for the subtraction operation. |
| `*` | `btnMul` | A button for the multiplication operation. |
| `/` | `btnDiv` |  A button for the integer division operation. |

* *Styling*. The document's elements must have the following styles:
    * `body` has a width of `33%`.
    * `res` has a `background-color` of `lightgray`, a `border` that is `solid`, a height of `48px`, and a `font-size` of `20px`.
    * `btn0` and `btn1` have a `background-color` of `lightgreen` and a `color` of `brown`.
    * `btnClr` and `btnEql` have a background-color of `darkgreen` and a `color` of `white`.
    * `btnSum`, `btnSub`, `btnMul`, and `btnDiv` have a `background-color` of `black`, a `color` of `red`.
    * All the buttons in btns have a `width` of `25%`, a `height` of `36px`, a `font-size` of `18px`, `margin` of `0px`, and `float` value `left`.
    
    The `.js` and `.css` files are in different directories, so use the *link* tag to provide the CSS file path and the *script* tag to provide the JS file path:

```
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/binaryCalculator.css" type="text/css">
    </head>
    
    <body>
        <script src="js/binaryCalculator.js" type="text/javascript"></script>
    </body>
</html>
```
## Constraints

* All expressions in the test dataset are entered in the form ***operand*****1** ⟶ ***operator*** ⟶ ***operand*****2**, where ***operand*****1** is the first binary number, ***operand*****2** is the second binary number, and ***operator*** is in the set **{+, -, *, =}**.

* Both operands will always be positive integers when converted from base-**2** to base-**10**.

* All expressions will be valid.

## Explanation

Consider the following sequence of button clicks:

**1 ⟶ 1 ⟶ 0 ⟶ 1 ⟶ + ⟶ 1 ⟶ 0 ⟶ 0 ⟶ 0  =**

Before pressing the **=** button, the result *div* looks like this:

![alt text](https://s3.amazonaws.com/hr-challenge-images/18103/1456666017-1857ab934b-ScreenShot2016-02-28at6.55.52PM.png)

After pressing the **=** button to evaluate our expression, the result *div* looks like this:

![alt text](https://s3.amazonaws.com/hr-challenge-images/18103/1456666141-da2d0c1331-ScreenShot2016-02-28at6.58.38PM.png)

Notice that **(11011)<sub>2</sub> = (27)<sub>10</sub>**, **(1000)<sub>2</sub> = (8)<sub>10</sub>**, and **(100011)<sub>2</sub> = (35)<sub>10</sub>**, so our calculator evaluated the expression correctly.

Now, let's consider our next sequence of button clicks as:

**0 ⟶ 1 ⟶ * ⟶ 1 ⟶ 1 ⟶ 1 ⟶ =**

Before pressing the **=** button, the result div looks like this:

![alt text](https://s3.amazonaws.com/hr-challenge-images/18103/1456666566-39a02c93ac-ScreenShot2016-02-28at7.04.23PM.png)

After pressing the **=** button to evaluate our expression, the result *div* looks like this:

![alt text](https://s3.amazonaws.com/hr-challenge-images/18103/1456666602-bb107fb013-ScreenShot2016-02-28at7.05.26PM.png)

Consider the next sequence of button clicks as:

**C ⟶ 1 ⟶ 1**

The result *div* looks like this:

![alt text](https://s3.amazonaws.com/hr-challenge-images/18103/1456667223-af168e6fc7-ScreenShot2016-02-28at7.16.38PM.png)
