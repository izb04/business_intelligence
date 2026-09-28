# Midwest Airbnb extended database

Local documentation reconstructed from the Assignment 06 instructions and the
supplied database; this is not the original document from the course ZIP.

## Tables

| Table | One row represents | Rows | Key |
| --- | --- | ---: | --- |
| `listings` | One listing in Chicago, Columbus, or Twin Cities | 14,887 | `id` |
| `availability_monthly` | One listing in one calendar month | 158,741 | `id`, `month` |
| `reviews_monthly` | One listing in one month with at least one review | 142,388 | `id`, `month` |

IDs are stored as text; preserve that type to avoid rounding large identifiers.
Join monthly tables to listings by `id` to obtain each listing's city.

## Listings

The 29-column listings table includes these fields used in the assignment:

| Column | Meaning |
| --- | --- |
| `id` | Listing identifier |
| `city` | Chicago, Columbus, or Twin Cities |
| `host_id` | Host account identifier, not necessarily a unique business |
| `room_type` | Room category; entire homes use `Entire home/apt` |
| `neighbourhood` | Neighbourhood within the city |
| `accommodates` | Number of guests accommodated |
| `price` | Nightly price in dollars from the listings table |
| `number_of_reviews` | Listing review count |
| `review_scores_rating` | Listing rating |
| `reviews_per_month` | Listing-level monthly review measure |
| `estimated_revenue_l365d` | Modeled estimated revenue over the last 365 days, in dollars |
| `host_is_superhost` | `t` for Superhost, `f` for other hosts, or missing |

## Availability by month

| Column | SQLite type | Meaning |
| --- | --- | --- |
| `id` | TEXT | Listing identifier |
| `month` | TEXT | Calendar month in `YYYY-MM` format |
| `nights_in_month` | INTEGER | Number of nights represented for that month |
| `nights_available` | INTEGER | Number of nights available |

The database's actual month range is `2026-07` through `2027-06`; the assignment
overview instead lists July 2026 through May 2027. Task 5 uses only `2026-10`.
A mostly-taken listing satisfies `nights_available < 0.5 * nights_in_month`.
Unavailable nights may be booked or blocked by the host; these data cannot
distinguish the two. The calendar contains no nightly prices.

## Reviews by month

| Column | SQLite type | Meaning |
| --- | --- | --- |
| `id` | TEXT | Listing identifier |
| `month` | TEXT | Review month in `YYYY-MM` format |
| `reviews` | INTEGER | Number of reviews in the listing-month |

Months run from `2024-07` through `2026-06`. Rows represent months with at least
one review. Task 6 sums reviews from `2025-07` through `2026-06`, inclusive.
Reviews measure demand as a proxy, not actual bookings.

## Interpretation and missing data

- Estimated revenue is modeled from reviews, not observed revenue. The supplied assignment does not specify the full formula.
- Missing SQLite values become `NA` in R; the assigned medians skip them with `na.rm = TRUE`.
- There are 456 listings with no availability rows: Chicago 267, Twin Cities 120, and Columbus 69.
- October availability shares use entire homes with a matching October row.
- Task 1 counts each host's listings across all three cities. A ten-listing cap would not affect hosts with exactly ten listings.
