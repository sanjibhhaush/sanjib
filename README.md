# Shopify Liquid Snippets

A collection of drop-in, dependency-free Liquid snippets for Shopify themes. Every snippet is self-documenting, accessible by default, and works in any Online Store 2.0 theme.

No app required. No JavaScript required. Copy the file, render it, done.

## Installation

Copy any `.liquid` file from `snippets/` into your theme's `snippets/` folder, then render it:

```liquid
{% render 'price', product: product, show_savings: true %}
```

With Shopify CLI:

```bash
cp snippets/price.liquid /path/to/your-theme/snippets/
shopify theme push
```

## Snippets

### `price.liquid`

Renders a price with automatic sale detection and an optional savings percentage badge.

```liquid
{% render 'price', product: product %}
{% render 'price', product: product, show_savings: true %}
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `product` | Object | — | Product or variant object (required) |
| `show_savings` | Boolean | `false` | Show a "Save X%" badge when on sale |

---

### `responsive-image.liquid`

Renders an image with a full `srcset`, explicit width/height (prevents layout shift), and lazy loading.

```liquid
{% render 'responsive-image',
   image: product.featured_image,
   sizes: '(min-width: 768px) 50vw, 100vw' %}
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `image` | Object | — | Shopify image object (required) |
| `alt` | String | `image.alt` | Alt text |
| `sizes` | String | `100vw` | `sizes` attribute |
| `loading` | String | `lazy` | `lazy` or `eager` |
| `class` | String | — | Extra CSS classes |

---

### `stock-status.liquid`

Shows in-stock, low-stock urgency, or out-of-stock messaging.

```liquid
{% render 'stock-status', variant: product.selected_or_first_available_variant %}
{% render 'stock-status', variant: variant, low_threshold: 10 %}
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `variant` | Object | — | Variant object (required) |
| `low_threshold` | Number | `5` | Quantity at or below which urgency shows |

> Requires inventory tracking enabled on the variant in Shopify admin for real numbers.

---

### `breadcrumbs.liquid`

Accessible breadcrumb navigation that adapts to product, collection, page, blog, article, search, and 404 templates automatically.

```liquid
{% render 'breadcrumbs' %}
```

No parameters — it reads `request.page_type`.

---

### `product-json-ld.liquid`

Outputs Schema.org JSON-LD structured data so Google can show price and availability in search results.

```liquid
{% render 'product-json-ld', product: product %}
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `product` | Object | — | Product object (required) |

Validate your output with [Google's Rich Results Test](https://search.google.com/test/rich-results).

---

### `pagination.liquid`

Accessible numbered pagination with proper `rel="prev"` / `rel="next"` and `aria-current`, replacing Shopify's `default_pagination` so you control the markup.

```liquid
{% paginate collection.products by 24 %}
  ...products...
  {% render 'pagination', paginate: paginate %}
{% endpaginate %}
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `paginate` | Object | — | The `paginate` object (required) |

---

### `free-shipping-bar.liquid`

Shows how much more a customer needs to spend to unlock free shipping, with an accessible progress bar.

```liquid
{% render 'free-shipping-bar', threshold: 99900 %}
```

| Parameter | Type | Default | Description |
|---|---|---|---|
| `threshold` | Number | — | Threshold in cents, e.g. `99900` = ₹999 (required) |

Suggested CSS:

```css
.free-shipping-bar__track { height: 6px; background: #eee; border-radius: 3px; }
.free-shipping-bar__fill { height: 100%; background: #FF3B30; border-radius: 3px; transition: width .3s ease; }
```

## Conventions

Every snippet in this repo follows the same rules:

- Documented with a `{% comment %}` block listing all accepted parameters
- Sensible defaults so the minimum call always works
- No external dependencies, no JavaScript, no build step
- Accessible markup (ARIA labels, semantic elements, `aria-current`)
- Safe with missing data — renders nothing rather than erroring

## Roadmap

- [ ] `variant-picker.liquid` — swatch-based variant selection
- [ ] `star-rating.liquid` — metafield-driven review stars
- [ ] `size-chart-modal.liquid`
- [ ] `recently-viewed.liquid` — localStorage-backed
- [ ] `collection-filters.liquid` — Storefront Filtering API
- [ ] Add a demo theme showing all snippets rendered together

## Contributing

PRs welcome. To add a snippet, please include:

1. The `{% comment %}` documentation block with all parameters
2. A section in this README following the existing table format
3. Sensible defaults so the snippet works with minimal arguments

## License

[MIT](LICENSE) © Sanjib Nayak
