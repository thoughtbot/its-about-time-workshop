# Exercise 1

---

## The bug

Amy Pond, an observer in Brno, books a session for 21:00 on 18 September. The
app stores it as 07:00, and that is what the session page shows. The app has the
wrong moment.

---

## Your job

Make `rake e1` pass by editing **`lib/booking.rb`**. That's the only file you
need to open.

Don't edit the tests. They describe what observers expect, so if one is failing,
the test is right.

```
rake e1
```

---

## Finished early?

Try these in a console:

- What does `Time.zone.parse` do with `"2026-02-30"`? With `"31/12/2026"`?
  With `"12/01/2026"`, and is that January or December? Should a booking form
  accept a string it can only guess at?
- `Observer#zone` returns an `ActiveSupport::TimeZone`. Ask it for
  `.tzinfo.canonical_identifier`. What is `"US/Eastern"` really?
- Amy Pond moves to Tokyo and updates her profile. What should happen to the
  sessions she booked last week?
