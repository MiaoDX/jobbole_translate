
Getting Started with Behavior Testing in Python with Behave

Learn how to write behavioral tests for your next Python application using the Behave library.

使用 Behave 在 python 中进行行为测试入门

学习如何使用 Behave 库为你下一个 python 应用编写行为测试。

---

## Introduction

Behavior testing simply means that we should test how an application behaves in certain situations. Often the behavior is given to us developers by our customers. They describe the functionality of an application, and we write code to meet their specifications. Behavioral tests are a tool to formalize their requirements into tests. This leads naturally to behavior-driven development [(BDD)](https://semaphoreci.com/community/tutorials/behavior-driven-development).

After completing this tutorial, you should be able to:

*   Explain the benefits of behavior testing
*   Explain the "given", "when", and "then" phases of Behave
*   Write basic behavioral tests using Behave
*   Write parameterized behavioral tests using Behave

## 简介

行为测试简单地讲是我们应该测试一个应用在特定场景下的行为表现，通常地，行为是用户给我们开发者的。他们（客户）描述了应用的功能，我们编写满足他们需求的代码。行为测试是一种将需求形式化为测试的工具，这样很自然地引出行为驱动测试[(BDD)](https://semaphoreci.com/community/tutorials/behavior-driven-development)。

在完成这个教程之后，你应该可以做到：

*   解释行为测试的好处
*   解释 Behave 库的 “given”， “when” 和 “then” 阶段
*   使用 Behave 编写基本的行为测试
*   使用 Behave 编写参数化的行为测试

---

## Prerequisites

Before starting, make sure you have the following installed:

*   [Python 3.x](https://www.python.org/downloads/?__hstc=233161921.1fa2d526901eecea4854134050555337.1471569543443.1471572299180.1471592605671.3&amp;__hssc=233161921.1.1471592605671&amp;__hsfp=2883479693)
*   [Behave](http://pythonhosted.org/behave/install.html?__hstc=233161921.1fa2d526901eecea4854134050555337.1471569543443.1471572299180.1471592605671.3&amp;__hssc=233161921.1.1471592605671&amp;__hsfp=2883479693)

## 前提

在开始前，确保你安装了：

*   [Python 3.x](https://www.python.org/downloads/?__hstc=233161921.1fa2d526901eecea4854134050555337.1471569543443.1471572299180.1471592605671.3&amp;__hssc=233161921.1.1471592605671&amp;__hsfp=2883479693)
*   [Behave](http://pythonhosted.org/behave/install.html?__hstc=233161921.1fa2d526901eecea4854134050555337.1471569543443.1471572299180.1471592605671.3&amp;__hssc=233161921.1.1471592605671&amp;__hsfp=2883479693)

---

## Setting Up Your Environment

This tutorial will walk you through writing tests for and coding a feature of a [Twenty-One](https://en.wikipedia.org/wiki/Blackjack?__hstc=233161921.1fa2d526901eecea4854134050555337.1471569543443.1471572299180.1471592605671.3&amp;__hssc=233161921.1.1471592605671&amp;__hsfp=2883479693) (or "Blackjack") game. Specifically, we'll be testing the logic for the dealer. To get started, create a root directory where your code will go, and then create the following directories and blank files:

``` vi
.
├── features
│   ├── dealer.feature
│   └── steps
│       └── steps.py
└── twentyone.py
```

Here's a brief explanation of the files:

*   dealer.feature: The written out tests for the dealer feature.
*   steps.py: The code that runs the tests in `dealer.feature`.
*   twentyone.py: The implementation code for the dealer feature.

## 准备环境

本教程将逐步引导你为[21 点](https://en.wikipedia.org/wiki/Blackjack?__hstc=233161921.1fa2d526901eecea4854134050555337.1471569543443.1471572299180.1471592605671.3&amp;__hssc=233161921.1.1471592605671&amp;__hsfp=2883479693) (或者 “黑杰克”"Blackjack")游戏编写一个功能，并为其设计测试用例。
特别地，我们将测试 `dealer`（发牌员）的逻辑，刚开始，新建一个根目录来放置你将要编写的代码，然后新建下面的文件夹和空文件：

``` vi
.
├── features
│   ├── dealer.feature
│   └── steps
│       └── steps.py
└── twentyone.py
```

给出这些文件的简单解释：

*   dealer.feature：为 dealer 功能编写的测试
*   steps.py：用来运行在 `dealer.feature` 编写的测试的代码
*   twentyone.py：发牌员功能（feature）的实现代码

---

## Writing Your First Test

Although behavioral tests do not require test-driven development, the two methodologies go hand-in-hand. We'll approach this problem from a test-driven perspective, so instead of jumping to code, we'll start with the tests.

### Writing the Scenario

Open `dealer.feature` and add the following first line:

``` vi
Feature: The dealer for the game of 21
```

This line describes the feature. In a large application, you would have many features. Next, we'll add a test. The first test will be simple — when the round starts, the dealer should deal itself two cards. The word Behave uses to define a test is "Scenario", so go ahead and add the following line:

``` vi
Scenario: Deal initial cards
```

Before we write more, we need to understand the three phases of a basic Behave test: "Given", "When", and "Then". "Given" initializes a state, "When" describes an action, and "Then" states the expected outcome. For this test, our state is a new dealer object, the action is the round starting, and the expected outcome is that the dealer has two cards. Here's how this is translated into a Behave test:

``` vi
Scenario: Deal initial cards
  Given a dealer
  When the round starts
  Then the dealer gives itself two cards
```

## 编写你的第一个测试

尽管行为测试不要求测试驱动开发，但这两种方法相辅相成。我们将从一个测试驱动的视角来着手处理这个问题，所以不直接跳到代码上，我们先由测试开始。

### 编写情境（Scenario）

打开 `dealer.feature` 添加第一行如下：

``` vi
Feature: The dealer for the game of 21
```

这一行描述了一个功能（feature），在大的应用中，你可能有很多功能（feature）。然后我们添加一个测试，第一个测试很简单 —— 当回合开始时，发牌员给自己发两张牌。Behave 中定义一个测试的关键词是 "Scenario"，所以继续添加下面一行：
   
``` vi
Scenario: Deal initial cards
```

在我们编写更多的（测试）之前，我们需要理解一个基本的 Behave 测试的三个阶段：“Given”，“When” 和 “Then”。"Given" 初始化一个状态，"When" 描述一个动作，"Then" 给出预期结果。对于这个测试，我们的状态是一个新的发牌员对象，动作是回合开始，预期结果是发牌员有两张纸牌。下面来看看，它是如何被翻译成一个 Behave 测试用例的：

``` vi
Scenario: Deal initial cards
  Given a dealer
  When the round starts
  Then the dealer gives itself two cards
```

Notice that the three phases read like a normal English sentence. You should strive for this when writing behavioral tests because they are easily readable by anyone working in the code base.

---

Now to see how Behave works, simply open a terminal in the root directory of your code and run the following command:

`behave`

You should see this output:

``` vi
Feature: The dealer for the game of 21 # features/dealer.feature:1

  Scenario: Deal initial cards             # features/dealer.feature:3
    Given a dealer                         # None
    When the round starts                  # None
    Then the dealer gives itself two cards # None

Failing scenarios:
  features/dealer.feature:3  Deal initial cards

0 features passed, 1 failed, 0 skipped
0 scenarios passed, 1 failed, 0 skipped
0 steps passed, 0 failed, 0 skipped, 3 undefined
Took 0m0.000s

You can implement step definitions for undefined steps with these snippets:
[ The rest of output removed for brevity ]
```

The key part here is that we have one failing scenario (and therefore a failing feature) that we need to fix. Below that, Behave suggests how to implement steps. You can think of a step as a task for Behave to execute. Each phase ("given", "when", and "then") are all implemented as steps.

注意到这三个阶段读起来就像是正常的英语句子，你应该在编写行为测试时应该坚持这一点因为它们能够被工作在代码库中的任何人轻松理解。

现在看一下 Behave 是如何工作的，简单地在代码根目录下打开一个命令行并运行如下指令：

`behave`

你应该看到下面的输出：

``` vi
Feature: The dealer for the game of 21 # features/dealer.feature:1

   Scenario: Deal initial cards             # features/dealer.feature:3
    Given a dealer                         # None
    When the round starts                  # None
    Then the dealer gives itself two cards # None

Failing scenarios:
  features/dealer.feature:3  Deal initial cards

0 features passed, 1 failed, 0 skipped
0 scenarios passed, 1 failed, 0 skipped
0 steps passed, 0 failed, 0 skipped, 3 undefined
Took 0m0.000s

You can implement step definitions for undefined steps with these snippets:
[ The rest of output removed for brevity ]
```

这里的关键是我们有一个需要我们修正的失败的情景（也就是说一个失败的功能），下面是 Behave 建议实现的步骤。你可以把一个步骤想做是 Behave 来执行的任务，每个阶段（“given”，“when” 和 “then”）都作为步骤实现。

---

### Writing the Steps

The steps that Behave runs are written in Python and they are the link between the descriptive tests in `.feature` files and the actual application code. Go ahead and open `steps.py` and add the following imports:

``` python
from behave import *
from twentyone import *
```

Behave steps use annotations that match the names of the phases. This is the first step as described in the scenario:

``` python
@given('a dealer')
def step_impl(context):
    context.dealer = Dealer()
```

It's important to notice that the text inside of the annotation matches the scenario text exactly. If it doesn't match, the test cannot run.

The context object is passed from step to step, and it is where we can store information to be used by other steps. Since this step is a "given", we need to initialize our state. We do that by creating a `Dealer` object, and attaching that object to the `context`. If you run `behave` again, you'll see the test fails, but now for a different reason: We haven't defined the Dealer class yet! Again, we have a failing test that is "driving" us to do work.

### 编写步骤（steps）

Behave 运行的步骤用 python 写成并且将在 `.feature` 文件里的描述性测试和实际的应用代码联系起来。继续打开 `steps.py` 并添加如下的包含（import）：

``` python
from behave import *
from twentyone import *
```

Behave 的步骤使用与阶段（译注：given,when,then）名字匹配的注释，下面是在情境中描述的第一步：

``` python
@given('a dealer')
def step_impl(context):
    context.dealer = Dealer()
```

需要指出的是注释内部的文本与情境的文本严格匹配，如若不然，测试无法运行。

上下文（context）对象在步骤之间传递，在其中我们可以存储被其他步骤使用的信息，由于目前的步骤是 “given”，我们需要初始化我们的状态（state）。我们通过构造一个 `Dealer` 对象并将 `context` 与它对应起来。如果你再次运行 `behave`，你会看到测试失败，但这次是不同的原因：我们目前还没有定义`Dealer`类！再一次我们有了一个失败的测试来“推动”（driving）我们进一步工作。

---

Now we will open `twentyone.py` and create a `Dealer` class:

``` python
class Dealer():
    pass
```

Run `behave` once again to verify that we fixed the last error we saw, but that the scenario still fails because the "when" and "then" steps are not implemented. From here on, the tutorial will not explicitly state when you should run `behave`. But remember, the cycle is to write a test, see that it fails, and then write code to make the test pass.

Here are the next steps to add to `steps.py`:

``` python
@when('the round starts')
def step_impl(context):
    context.dealer.new_round()

@then('the dealer gives itself two cards')
def step_impl(context):
    assert (len(context.dealer.hand) == 2)
```

Again, the annotation text matches the text in the scenario exactly. In the "when" step, we have access to the `dealer` created in "given" and we can now call a method on that object. Finally, in the "then" step, we still have access to the dealer, and we assert that the `dealer` has two cards in its hand.

现在我们打开 `twentyone.py` 并新建一个 `Dealer` 类：

``` python
class Dealer():
    pass
```

再次运行 `behave` 来确认我们修正了上次见到的错误，但是这个场景仍会因 “when” 以及 “then” 步骤还未实现而失败。从现在开始，这个教程不会显式地指出你何时应当运行 `behave`，但请记住，（我们有一个）循环 —— 编写测试，看到它失败然后编写代码使测试通过。

下面是添加到 `steps.py` 的下面的步骤：

``` python
@when('the round starts')
def step_impl(context):
    context.dealer.new_round()

@then('the dealer gives itself two cards')
def step_impl(context):
    assert (len(context.dealer.hand) == 2)
```

再次指出注释文本与情境文本需要严格匹配，在 “when” 步骤中我们对在 “given” 步骤中生成的对象 "delaer" 有访问权并且可以调用其方法，最后，在 “then” 步骤中我们仍有对 `dealer` 的访问权并且我们断言 `dealer` 有两张手牌。

---

We defined two new pieces of code that need to be implemented: `new_round()` and `hand`. Switch back to `twentyone.py` and add the following to the `Dealer` class:

``` python
class Dealer():
    def __init__(self):
        self.hand = []

    def new_round(self):
        self.hand = [_next_card(), _next_card()]
```

The `_next_card()` function will be defined as a top-level function of the module, along with a definition of the cards. At the top of the file, add the following:

``` python
import random

_cards = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']

def _next_card():
    return random.choice(_cards)
```

Remember that `random` is not secure and should not be used in a real implementation of this game, but for this tutorial it will be fine.

If you run `behave` now, you should see that the test passes:

``` vi
Feature: The dealer for the game of 21 # features/dealer.feature:1

  Scenario: Deal initial cards             # features/dealer.feature:3
    Given a dealer                         # features/steps/steps.py:5 0.000s
    When the round starts                  # features/steps/steps.py:9 0.000s
    Then the dealer gives itself two cards # features/steps/steps.py:14 0.000s

1 feature passed, 0 failed, 0 skipped
1 scenario passed, 0 failed, 0 skipped
3 steps passed, 0 failed, 0 skipped, 0 undefined
Took 0m0.000s
```

我们定义了两段新的需要实现的代码：`new_round()` 以及 `hand`，回到 `twentyone.py` 并给 `Dealer` 类添加下面的（方法）：

``` python
class Dealer():
    def __init__(self):
        self.hand = []

    def new_round(self):
        self.hand = [_next_card(), _next_card()]
```

其中 `_next_card()` 方法以及纸牌的定义将作为这个模块的顶级（top-level）函数，在文件的顶部添加下面的代码：

``` python
import random

_cards = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']

def _next_card():
    return random.choice(_cards)
```

需要记住 `random` 并不安全在实际实现这个游戏时不应该使用，但是在此教程中是合适的。

如果你现在运行 `behave` 会看到这些测试通过：

``` vi
Feature: The dealer for the game of 21 # features/dealer.feature:1

  Scenario: Deal initial cards             # features/dealer.feature:3
    Given a dealer                         # features/steps/steps.py:5 0.000s
    When the round starts                  # features/steps/steps.py:9 0.000s
    Then the dealer gives itself two cards # features/steps/steps.py:14 0.000s

1 feature passed, 0 failed, 0 skipped
1 scenario passed, 0 failed, 0 skipped
3 steps passed, 0 failed, 0 skipped, 0 undefined
Took 0m0.000s
```

---

### Writing Tableized Tests

Often when writing tests we want to test the same behavior against many different parameters and check the results. Behave makes this easier to do by providing tools to create a tableized test instead of writing out each test separately. The next game logic to test is that the dealer knows the point value of its hand. Here is a test that checks several scenarios:

``` vi
Scenario Outline: Get hand total
  Given a <hand>
  When the dealer sums the cards
  Then the <total> is correct

  Examples: Hands
  | hand          | total |
  | 5,7           | 12    |
  | 5,Q           | 15    |
  | Q,Q,A         | 21    |
  | Q,A           | 21    |
  | A,A,A         | 13    |
```

You should recognize the familiar "given, when, then" pattern, but there's a lot of differences in this test. First, it is called a "Scenario Outline". Next, it uses parameters in angle brackets that correspond to the headers of the table. Finally, there's a table of inputs ("hand") and outputs ("total").

The steps will be similar to what we've seen before, but we'll now get to use the parameterized steps feature of Behave.

### 编写成组的（Tableized）测试

经常地，在编写测试时我们想要使用许多不同参数来测试某个行为并检查其结果，Behave 通过提供构建成组的测试而不是单独写出每一个测试的工具使得这个过程更加简单。下一个需要测试的游戏逻辑是测试发牌员知道他手中纸牌的点数，下面是检测一些情境的测试：

``` vi
Scenario Outline: Get hand total
  Given a <hand>
  When the dealer sums the cards
  Then the <total> is correct

  Examples: Hands
  | hand          | total |
  | 5,7           | 12    |
  | 5,Q           | 15    |
  | Q,Q,A         | 21    |
  | Q,A           | 21    |
  | A,A,A         | 13    |
```

你应该认出了熟悉的 "given, when, then" 模式，但是这个测试中有许多不同，首先它叫做 “Scenario Outline”（情境大纲），然后它的参数在尖括号中并与与表格头部对应，最后有一个拥有输入（手牌，“hand”）输出（总点数，“total”）的表格。

这些步骤与我们之前看到的很相似，但是我们现在将开始使用 Behave 参数化的步骤特征。

---

Here's how to implement the new "given" step:

``` python
@given('a {hand}')
def step_impl(context, hand):
    context.dealer = Dealer()
    context.dealer.hand = hand.split(',')
```

The angle brackets in the `dealer.feature` file are replaced with braces, and the `hand` parameter becomes an object that is passed to the step, along with the context.

Just like before, we create a new `Dealer` object, but this time we manually set the dealer's cards instead of generating them randomly. Since the `hand` parameter is a simple string, we split the parameter to get a list.

Next, add the remaining steps:

``` python
@when('the dealer sums the cards')
def step_impl(context):
    context.dealer_total = context.dealer.get_hand_total()

@then('the {total:d} is correct')
def step_impl(context, total):
    assert (context.dealer_total == total)
```

下面是如何实现新的“given”步骤：

``` python
@given('a {hand}')
def step_impl(context, hand):
    context.dealer = Dealer()
    context.dealer.hand = hand.split(',')
```

在 `dealer.feature` 文件中的尖括号被替代为花括号，并且 `hand` 参数与 `context` 一起成为在步骤间传递的对象。

与之前一样，我们新建一个 `Dealer` 对象，但这次我们手动设置而非随机生成发牌员的纸牌。由于 `hand` 参数是一个简单的字符串，我们拆分这些参数得到一个列表（list）。

接着添加下面的步骤：

``` python
@when('the dealer sums the cards')
def step_impl(context):
    context.dealer_total = context.dealer.get_hand_total()

@then('the {total:d} is correct')
def step_impl(context, total):
    assert (context.dealer_total == total)
```

---

The "when" step is nothing new, and the "then" step should look familiar. If you're wondering about the ":d" after the `total` parameter, that is a shortcut to tell Behave to treat the parameter as an integer. It saves us from manually casting with the `int()` function. Here's a complete [list of patterns](https://pythonhosted.org/behave/parse_builtin_types.html?__hstc=233161921.1fa2d526901eecea4854134050555337.1471569543443.1471572299180.1471592605671.3&amp;__hssc=233161921.1.1471592605671&amp;__hsfp=2883479693) that Behave accepts and if you need advanced parsing, you can [define your own pattern](https://pythonhosted.org/behave/api.html?__hstc=233161921.1fa2d526901eecea4854134050555337.1471569543443.1471572299180.1471592605671.3&amp;__hssc=233161921.1.1471592605671&amp;__hsfp=2883479693#step-parameters).

There's many different approaches to summing values of cards, but here's one solution to find the total of the dealer's hand. Create this as a top-level function in the `twentyone.py` module:

``` python
def _hand_total(hand):
    values = [None, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 10]
    value_map = {k: v for k, v in zip(_cards, values)}

    total = sum([value_map[card] for card in hand if card != 'A'])
    ace_count = hand.count('A')

    for i in range(ace_count, -1, -1):
        if i == 0:
            total = total + ace_count
        elif total + (i * 11) + (ace_count - i) &lt;= 21:
            total = total + (i * 11) + ace_count - i
            break

    return total
```

“when”步骤没有什么新鲜的，并且“then”步骤看起来也熟悉，如果你想知道在 `total` 参数后的 `:d` 的意思，它是一个简写来告诉 Behave 将参数作为整数对待。这帮我们不必手工写出 `int()` 函数。这里有一个 Behave 接受的完整的[模式列表](https://pythonhosted.org/behave/parse_builtin_types.html?__hstc=233161921.1fa2d526901eecea4854134050555337.1471569543443.1471572299180.1471592605671.3&amp;__hssc=233161921.1.1471592605671&amp;__hsfp=2883479693)，如果你想高级的解析，还可以[定义自己的模式](https://pythonhosted.org/behave/api.html?__hstc=233161921.1fa2d526901eecea4854134050555337.1471569543443.1471572299180.1471592605671.3&amp;__hssc=233161921.1.1471592605671&amp;__hsfp=2883479693#step-parameters).

有许多不同的计算纸牌和的方法，这里给出一种计算发牌员手牌的方法，在 `twentyone.py` 模块里新建一个顶级函数：

``` python
def _hand_total(hand):
    values = [None, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 10]
    value_map = {k: v for k, v in zip(_cards, values)}

    total = sum([value_map[card] for card in hand if card != 'A'])
    ace_count = hand.count('A')

    for i in range(ace_count, -1, -1):
        if i == 0:
            total = total + ace_count
        elif total + (i * 11) + (ace_count - i) &lt;= 21:
            total = total + (i * 11) + ace_count - i
            break

    return total
```

---

In short, the function maps the card character strings to point values, and sums the values. However, aces have to be handled separately because they can value 1 or 11 points.

We also need to give the dealer the ability to total its cards. Add this function to the `Dealer` class:

``` python
def get_hand_total(self):
    return _hand_total(self.hand)
```

If you run `behave` now, you'll see that each example in the table runs as its own scenario. This saves a lot of space in the features file, but still gives us rigorous tests that pass or fail individually.

简单地说，这个方法把纸牌字符映射为点值，并将这些值加起来。然而 尖子（译注：纸牌中的A）因为可以作为 1 或者 11 点需要单独处理。

我们也需要给发牌员计算他点数的能力，在 `Dealer` 类中添加这个方法：

``` python
def get_hand_total(self):
    return _hand_total(self.hand)
```

如果你现在运行 `behave` 会看到每个表格中的例子在其自己的情境中运行。这节省了很多 feature 文件里的空间，但仍能给我们单个测试通过与否的严格结果。

---

We'll add one more tableized test, this time to test that the dealer plays by the rules. Traditionally, the dealer must play "hit" until he or she has 17 or more points. Add this scenario outline to test that behavior:

``` vi
Scenario Outline: Dealer plays by the rules
  Given a hand <total>
   when the dealer determines a play
   then the <play> is correct

  Examples: Hands
  | total  | play   |
  | 10     | hit    |
  | 15     | hit    |
  | 16     | hit    |
  | 17     | stand  |
  | 18     | stand  |
  | 19     | stand  |
  | 20     | stand  |
  | 21     | stand  |
  | 22     | stand  |
```

我们再写一个成组测试，这次测试发牌员按规则玩牌，习惯上，发牌员在他或她拥有 17 及以上点数之前都必须要“拿牌”（"hit"），下面是一个测试这种行为的测试大纲：

``` vi
Scenario Outline: Dealer plays by the rules
  Given a hand <total>
   when the dealer determines a play
   then the <play> is correct

  Examples: Hands
  | total  | play   |
  | 10     | hit    |
  | 15     | hit    |
  | 16     | hit    |
  | 17     | stand  |
  | 18     | stand  |
  | 19     | stand  |
  | 20     | stand  |
  | 21     | stand  |
  | 22     | stand  |
```

Before we add the next steps, it's important to understand that when using parameters, the order matters. Parameterized steps should be ordered from most restrictive to least restrictive. If you do not do this, the correct step may not be matched by Behave. To make this easier, group your steps by type. Here is the new given step, ordered properly:

``` python
@given('a dealer')
def step_impl(context):
    context.dealer = Dealer()

## NEW STEP
@given('a hand {total:d}')
def step_impl(context, total):
    context.dealer = Dealer()
    context.total = total

@given('a {hand}')
def step_impl(context, hand):
    context.dealer = Dealer()
    context.dealer.hand = hand.split(',')
```

The typed parameter `{total:d}` is more restrictive than the untyped `{hand}`, so it must come earlier in the file.

在我们添加新的步骤之前，需要了解在使用参数时，顺序很重要。参数化的步骤需要按限制高到限制低的顺序排列，如果你不这样做，Behave 也许不会匹配原本是正确的步骤。 

为使得事情更加简单，把你的步骤按类型（译注："given,when,then"）分组，下面是一个新的排列合适的步骤：

``` python
@given('a dealer')
def step_impl(context):
    context.dealer = Dealer()

## NEW STEP
@given('a hand {total:d}')
def step_impl(context, total):
    context.dealer = Dealer()
    context.total = total

@given('a {hand}')
def step_impl(context, hand):
    context.dealer = Dealer()
    context.dealer.hand = hand.split(',')
```

有类型的参数 `{total:d}` 比无类型的 `{hand}` 更有限制性，所以它必须在文件中更早地出现。

---

The new "when" step is not parameterized and can be placed anywhere, but, for readability, should be grouped with the other `when` steps:
``` python
@when('the dealer determines a play')
def step_impl(context):
    context.dealer_play = context.dealer.determine_play(context.total)
```

Notice that this test expects a `determine_play()` method, which we can add to the `Dealer` class:

``` python
def determine_play(self, total):
    if total &lt; 17:
        return 'hit'
    else:
        return 'stand'
```

Last, the "then" step is parameterized so it needs to also be ordered properly:

``` python
@then('the dealer gives itself two cards')
def step_impl(context):
    assert (len(context.dealer.hand) == 2)

@then('the {total:d} is correct')
def step_impl(context, total):
    assert (context.dealer_total == total)

## NEW STEP
@then('the {play} is correct')
def step_impl(context, play):
    assert (context.dealer_play == play)
```

新的 “when” 步骤不是参数化的可以放置在任何位置，但为了方便阅读，应该与其他的 “when” 步骤放在一起：

``` python
@when('the dealer determines a play')
def step_impl(context):
    context.dealer_play = context.dealer.determine_play(context.total)
```

注意到这个测试需要 `determine_play()` 方法，我们可以在 `Dealer` 类中添加：

``` python
def determine_play(self, total):
    if total &lt; 17:
        return 'hit'
    else:
        return 'stand'
```

最后，“then” 步骤是参数化的所以应该合理地排列：

``` python
@then('the dealer gives itself two cards')
def step_impl(context):
    assert (len(context.dealer.hand) == 2)

@then('the {total:d} is correct')
def step_impl(context, total):
    assert (context.dealer_total == total)

## NEW STEP
@then('the {play} is correct')
def step_impl(context, play):
    assert (context.dealer_play == play)
```

---

## Putting Everything Together

We're going to add one final test that will tie together all of the code we've just written. We've proven to ourselves with tests that the dealer can deal itself cards, determine its hand total, and make a play separately, but there's no code to tie this together. Since we are emphasizing test-driven development, let's add a test for this behavior.

``` vi
Scenario: A Dealer can always play
  Given a dealer
  When the round starts
  Then the dealer chooses a play
```

We already wrote steps for the "given" and "when" statements, but we need to add a step for "the dealer chooses a play." Add this new step, and be sure to order it properly:

``` python
@then('the dealer gives itself two cards')
def step_impl(context):
    assert (len(context.dealer.hand) == 2)

#NEW STEP
@then('the dealer chooses a play')
def step_impl(context):
    assert (context.dealer.make_play() in ['stand', 'hit'])

@then('the {total:d} is correct')
def step_impl(context, total):
    assert (context.dealer_total == total)
```

## 组合起来

我们将写一个测试把我们已经写的代码整合起来，我们已经使用测试向自己证明了发牌员可以发牌，确定他的手牌点数和，并且独立玩牌，但是还没有一个把这些整合到一起的代码。既然我们是着重测试驱动开发，让我们为这个行为添加一个测试：

``` vi
Scenario: A Dealer can always play
  Given a dealer
  When the round starts
  Then the dealer chooses a play
```

我们已经写了 “given” 以及 “when” 语句的步骤，但我们需要添加一个新的 “the dealer chooses a play.” 步骤，添加这个步骤并保证排列合适：

``` python
@then('the dealer gives itself two cards')
def step_impl(context):
    assert (len(context.dealer.hand) == 2)

#NEW STEP
@then('the dealer chooses a play')
def step_impl(context):
    assert (context.dealer.make_play() in ['stand', 'hit'])

@then('the {total:d} is correct')
def step_impl(context, total):
    assert (context.dealer_total == total)
```

---

This test relies on a new method `make_play()` that you should now add to the `Dealer` class:

``` python
def make_play(self):
    return self.determine_play(self.get_hand_total())
```

This method isn't critical, but makes it easier to use the `Dealer` class.

If you've done everything correctly, running behave should display all of the tests and give a summary similar to this:

``` vi
1 feature passed, 0 failed, 0 skipped
16 scenarios passed, 0 failed, 0 skipped
48 steps passed, 0 failed, 0 skipped, 0 undefined
Took 0m0.007s
```

这个测试依赖一个新的方法：`make_play()`，你需要把这个方法添加到 `Dealer` 类中:

``` python
def make_play(self):
    return self.determine_play(self.get_hand_total())
```

这个方法并不是很关键的，但它使得使用 `Dealer` 类更加容易。

如果你每件事都做得正确，运行 `behave` 应该会显示所有的测试并给出一个类似于下面的总结：

``` vi
1 feature passed, 0 failed, 0 skipped
16 scenarios passed, 0 failed, 0 skipped
48 steps passed, 0 failed, 0 skipped, 0 undefined
Took 0m0.007s
```

---

## Conclusion

This tutorial walked you through setting up a new project with the Behave library and using test-driven development to build the code based off of behavioral tests.

If you would like to get experience writing more tests with this project, try implementing a `Player` class and `player.feature` that plays with some [basic strategy](https://en.wikipedia.org/wiki/Blackjack?__hstc=233161921.1fa2d526901eecea4854134050555337.1471569543443.1471572299180.1471592605671.3&amp;__hssc=233161921.1.1471592605671&amp;__hsfp=2883479693#Basic_strategy).

To learn more about BDD and why you might want to adopt it, check out our article on [Behavior-Driven Development](https://semaphoreci.com/community/tutorials/behavior-driven-development).

## 总结

本教程带你通过使用 Behave 库以及测试驱动开发来编写了一个基于行为测试的新工程。 

如果你想要通过在此工程上写更多的测试来获取经验，尝试实现一个 `Player` 类以及 `player.feature` 来玩一些[基本的策略](https://en.wikipedia.org/wiki/Blackjack?__hstc=233161921.1fa2d526901eecea4854134050555337.1471569543443.1471572299180.1471592605671.3&amp;__hssc=233161921.1.1471592605671&amp;__hsfp=2883479693#Basic_strategy)。

想要了解更多与 BDD 有关的知识以及你采用它的理由，参见我们的文章[行为驱动开发 Behavior-Driven Development](https://semaphoreci.com/community/tutorials/behavior-driven-development)