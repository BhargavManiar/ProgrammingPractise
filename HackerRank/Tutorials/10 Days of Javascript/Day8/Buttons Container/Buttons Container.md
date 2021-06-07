# Buttons Container

## Objective

In this challenge, we lay out buttons inside a *div* and modify their labels after each click event on one of the buttons. Check out the attached tutorial for learning materials.

## Task 
We want to create nine buttons enclosed in a *div*, laid out so they form a **3 x 3** grid. Each button has a distinct label from **1** to **9**, and the labels on the outer buttons must rotate in the clockwise direction each time we click the middle button.

Complete the code in the editor so that it satisfies the following criteria:

* *Initial State.* The initial layout looks like this: 

![alt text](https://s3.amazonaws.com/hr-challenge-images/0/1456631615-634977c808-ScreenShot2016-02-28at9.22.14AM.png)

* *Element IDs.* Each element in the document must have an `id`, specified below:
    * The button container *div's* `id` must be `btns`.
    * The initial `innerHTML` labels must have the following button `ids`:

| `innerHTML` |  `id` |
|----------|----------|
| `1` | `btn1`|
| `2` | `btn2`|
| `3` | `btn3`|
| `4` | `btn4`|
| `5` | `btn5`|
| `6` | `btn6`|
| `7` | `btn7`|
| `8` | `btn8`|
| `9` | `btn9`||

* `Styling.` The document's elements must have the following styles:
    * The `width` of `btns` is **75%**, relative to the document body's width.
    * Each button (i.e., `btn1` through `btn9`) satisfies the following:
        * The `width` is **30%**, relative to its container width.
        * The `height` is `48px`.
        * The `font-size` is` 24px`.

* Behavior. Each time `btn5` is clicked, the `innerHTML` text on the grid's outer buttons (i.e., `bt1`, `btn2`, `btn3`, `btn4`, `btn6`, `btn7`, `btn8`, `btn9`) must rotate in the *clockwise* direction. *Do not* update the button id's.

The `.js `and `.css` files are in different directories, so use the *link* tag to provide the CSS file path and the *script* tag to provide the JS file path:

```
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/buttonsGrid.css" type="text/css">
    </head>
    
    <body>
        <script src="js/buttonsGrid.js" type="text/javascript"></script>
    </body>
</html>
```
Explanation

Initially, the buttons look like this:

![alt text](https://s3.amazonaws.com/hr-challenge-images/0/1456632368-64062011d3-ScreenShot2016-02-28at9.22.14AM.png)

After clicking `btn5`  **1** time, they look like this:

![alt text](https://s3.amazonaws.com/hr-challenge-images/0/1456632450-3cda1c5938-ScreenShot2016-02-28at9.37.00AM.png)

After clicking `btn5`  **1** more time (for a total of **2** clicks), they look like this:

![alt text](https://s3.amazonaws.com/hr-challenge-images/0/1456632516-9a0d9cef8a-ScreenShot2016-02-28at9.38.04AM.png)
