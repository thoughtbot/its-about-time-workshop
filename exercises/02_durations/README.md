# Exercise 2: Durations

---

## The bug

Meridian Pro is billed monthly: whatever day a customer signs up becomes
their renewal date, and they are charged again on that same day every month.

Amy Pond signs up on January 31st. She is charged on February 28th, which is
fine. February is shorter, so this is expected. But then she is charged again on
March 28th, and again on April 28th. Her billing date has permanently drifted
from the 31st to the 28th.

This happens to every customer who signs up on the 29th, 30th or 31st of a
month.

---

## Your job

Make `rake e2` pass by editing **`lib/subscription.rb`**.

```bash
rake e2
```

---

## Finished early?

- What should happen to a customer who signs up on 29 February? Write the test
  you would want, then decide whether your fix passes it.

- `1.month + 1.day` and `1.day + 1.month` compare equal as durations. Are they
  interchangeable when added to 30 January?

- Amy Pond cancels halfway through a period and wants a refund. What is the
  denominator? Sixteen days into January is a different share of the period
  than sixteen days into February, and a customer who notices will be right.

- A trial is "14 days" and a subscription is "1 month". Which of those two is
  the customer more likely to argue with you about and why?
