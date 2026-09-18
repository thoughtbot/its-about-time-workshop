# Exercise 3: Ambiguity

---

## The bug

Amy Pond schedules an observation session for 02:30 that night. She gets the
reminder, goes outside, comes back in, and gets the same reminder again an hour
later. There is only one session on her calendar, but the app fired the reminder
for it twice.

Months earlier, on March 29th, she typed 02:30 and the app saved 03:30.

---

## Your job

Make `rake e3` pass by editing **`lib/session_planner.rb`**.

```bash
rake e3
```

---

## Finished early?

- You have both moments. Now design the dialog. What exactly do you show Amy
  Pond, in words, at 02:30 on 25 October?

- `dst:` is not a universal answer. On 26 October 2014 Moscow put its clocks
  back an hour and abolished daylight saving in the same move, so 01:30 that
  morning happened twice and _neither_ of them was summer time. Run your
  `moments_for` against `Europe/Moscow` and that date. What happens, and what
  should?

- Underneath `local_to_utc` is `TZInfo::Timezone#periods_for_local`, which
  returns 1 period, or 2, or 0. Try it on your three dates.
