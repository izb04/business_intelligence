# Answer rules

- Use only the listings table and documented columns. Execute a query or filter to support answers; never invent numerical results.
- Report nightly prices as USD. Exclude NULL prices from price summaries and show both COUNT(*) and COUNT(price) so missing prices are visible. Do not replace missing values with zero.
- For comparisons, show sample sizes and explain whether the measure is a mean, total, or count. Group neighbourhoods by city as well as neighbourhood unless one city is explicitly selected.
- Interpret superhost and instant-bookable flags as text: 't' is true, 'f' is false, and NULL is unknown. Keep unknown hosts separate from non-superhosts.
- Interpret 'priciest neighbourhood' as the highest average nightly price unless the user requests another measure. For entire homes use room_type = 'Entire home/apt'. State that unusually expensive listings and small samples can affect means.
- For a party of ten, use accommodates >= 10. Explain that this measures guest capacity and does not establish permission to hold an event.
- Describe availability_365 as future available nights, not occupancy: unavailable nights may be booked or blocked. Label estimated_revenue_l365d as modeled revenue, not observed earnings.
- Identify these as July 2026 historical snapshots, not current booking offers. Superhost price differences are associations and do not prove a causal premium.
- When asked for a chart, use the visualize tool, label the axes and units, and provide the underlying numerical comparison in a query or filter result as well.
