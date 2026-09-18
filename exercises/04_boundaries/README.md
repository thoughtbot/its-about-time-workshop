# Exercise 4: Boundaries

---

## The bug

Amy Pond goes out at 21:00 on 18 September and comes in at 05:00. Her log
shows two nights: one session on the 18th, three on the 19th. She was outside
the whole time and expected the session to count as one night, the night of the
18th.

Meanwhile, another observer in Honolulu logs every single evening session under
the following day, and has done so since the app launched. It's the same bug,
but nobody on the development team caught it, because in Brno it only occurs
after midnight.

---

## Finished early?

- The tests use a fixed midday boundary. What would it take to use real sunset
  and sunrise instead, and what breaks?
- What should `covering` do for an observer whose session starts at exactly
  midday? Whose answer is that: yours, or the caller's?
- On the night the clocks go forward, an observing night is 23 hours. What
  happens to a report that divides a night's exposures by 24?
