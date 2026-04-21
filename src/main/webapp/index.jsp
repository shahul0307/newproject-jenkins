<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<title>NexusShop — Premium Collection</title>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,700;0,900;1,700&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
  :root {
    --black: #0a0a0a;
    --dark: #111111;
    --dark2: #181818;
    --gold: #c9a84c;
    --gold2: #e8c96e;
    --cream: #f5f0e8;
    --muted: #888;
    --white: #fafafa;
    --radius: 4px;
    --radius-lg: 16px;
    --font-display: 'Playfair Display', Georgia, serif;
    --font-body: 'DM Sans', system-ui, sans-serif;
    --ease: cubic-bezier(.16,1,.3,1);
  }

  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  html { scroll-behavior: smooth; }

  body {
    font-family: var(--font-body);
    background: var(--black);
    color: var(--white);
    -webkit-font-smoothing: antialiased;
    overflow-x: hidden;
  }

  a { color: inherit; text-decoration: none; }

  /* ── GRAIN OVERLAY ── */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    z-index: 9999;
    pointer-events: none;
    opacity: .025;
    background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)'/%3E%3C/svg%3E");
    background-repeat: repeat;
    background-size: 128px;
  }

  .container { width: 100%; max-width: 1280px; margin: 0 auto; padding: 0 32px; }

  /* ── HEADER ── */
  header {
    position: fixed; top: 0; width: 100%; z-index: 100;
    padding: 20px 0;
    background: linear-gradient(180deg, rgba(10,10,10,.98) 0%, rgba(10,10,10,0) 100%);
    transition: background .4s;
  }
  header.scrolled {
    background: rgba(10,10,10,.97);
    border-bottom: 1px solid rgba(201,168,76,.12);
    backdrop-filter: blur(12px);
  }
  .header-inner { display: flex; align-items: center; justify-content: space-between; gap: 24px; }

  .brand {
    font-family: var(--font-display);
    font-size: 22px; font-weight: 900;
    letter-spacing: .02em;
    display: flex; align-items: center; gap: 4px;
  }
  .brand .dot { color: var(--gold); font-size: 28px; line-height: 0; vertical-align: middle; }

  nav ul { display: flex; gap: 4px; list-style: none; }
  nav ul li a {
    display: block; padding: 8px 14px; border-radius: 2px;
    font-size: 13px; font-weight: 500; letter-spacing: .06em; text-transform: uppercase;
    color: rgba(250,250,250,.65);
    transition: color .2s;
  }
  nav ul li a:hover { color: var(--gold); }

  .header-right { display: flex; align-items: center; gap: 6px; }

  .search-wrap {
    display: flex; align-items: center; gap: 10px;
    background: rgba(255,255,255,.04);
    border: 1px solid rgba(255,255,255,.07);
    padding: 8px 14px; border-radius: 2px;
    transition: border-color .2s;
  }
  .search-wrap:focus-within { border-color: rgba(201,168,76,.4); }
  .search-wrap input {
    background: none; border: none; outline: none;
    color: var(--white); font-size: 13px; font-family: var(--font-body);
    width: 200px;
  }
  .search-wrap input::placeholder { color: var(--muted); }

  .icon-btn {
    background: none; border: none; cursor: pointer;
    color: rgba(250,250,250,.7); font-size: 15px;
    width: 38px; height: 38px;
    display: inline-flex; align-items: center; justify-content: center;
    border-radius: 2px; transition: color .2s, background .2s;
  }
  .icon-btn:hover { color: var(--gold); background: rgba(201,168,76,.08); }

  .cart-btn {
    position: relative;
    background: none; border: 1px solid rgba(201,168,76,.25); cursor: pointer;
    color: var(--white); font-size: 15px;
    width: 40px; height: 40px;
    display: inline-flex; align-items: center; justify-content: center;
    border-radius: 2px; transition: border-color .2s, background .2s;
  }
  .cart-btn:hover { border-color: var(--gold); background: rgba(201,168,76,.1); }
  .cart-count {
    position: absolute; top: -7px; right: -7px;
    background: var(--gold); color: #0a0a0a;
    font-size: 10px; font-weight: 700;
    width: 18px; height: 18px;
    border-radius: 50%;
    display: grid; place-items: center;
  }

  /* ── HERO ── */
  .hero {
    min-height: 100vh;
    position: relative;
    display: flex; align-items: center;
    overflow: hidden;
    padding-top: 80px;
  }
  .hero-bg {
    position: absolute; inset: 0;
    background: url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1800&q=90') center/cover no-repeat;
    filter: brightness(.28) saturate(.8);
    transform: scale(1.05);
    animation: bgZoom 12s var(--ease) forwards;
  }
  @keyframes bgZoom { to { transform: scale(1); } }

  .hero::after {
    content: '';
    position: absolute; inset: 0;
    background: linear-gradient(to right, rgba(10,10,10,.85) 40%, transparent 100%),
                linear-gradient(to top, rgba(10,10,10,.9) 0%, transparent 50%);
  }
  .hero-content {
    position: relative; z-index: 2;
    padding: 80px 0;
    max-width: 680px;
  }
  .hero-eyebrow {
    display: inline-flex; align-items: center; gap: 10px;
    font-size: 11px; letter-spacing: .2em; text-transform: uppercase;
    color: var(--gold); margin-bottom: 24px;
    animation: fadeUp .8s .2s var(--ease) both;
  }
  .hero-eyebrow::before, .hero-eyebrow::after {
    content: ''; display: block; height: 1px; width: 28px; background: var(--gold);
  }
  .hero h1 {
    font-family: var(--font-display);
    font-size: clamp(52px, 7vw, 92px);
    line-height: 1.0;
    font-weight: 900;
    letter-spacing: -.02em;
    margin-bottom: 24px;
    animation: fadeUp .8s .35s var(--ease) both;
  }
  .hero h1 em { font-style: italic; color: var(--gold2); }
  .hero p {
    font-size: 17px; color: rgba(250,250,250,.65); line-height: 1.7;
    max-width: 480px; margin-bottom: 36px;
    animation: fadeUp .8s .5s var(--ease) both;
  }
  .hero-cta {
    display: flex; gap: 14px; flex-wrap: wrap;
    animation: fadeUp .8s .65s var(--ease) both;
  }

  @keyframes fadeUp { from { opacity: 0; transform: translateY(28px); } to { opacity: 1; transform: none; } }

  .btn {
    display: inline-flex; align-items: center; gap: 10px;
    padding: 14px 28px; border-radius: 2px;
    font-family: var(--font-body); font-size: 13px;
    font-weight: 500; letter-spacing: .08em; text-transform: uppercase;
    cursor: pointer; border: none; transition: all .25s;
  }
  .btn-gold {
    background: var(--gold); color: #0a0a0a;
  }
  .btn-gold:hover { background: var(--gold2); transform: translateY(-2px); box-shadow: 0 12px 32px rgba(201,168,76,.3); }
  .btn-outline {
    background: transparent; color: var(--white);
    border: 1px solid rgba(255,255,255,.2);
  }
  .btn-outline:hover { border-color: var(--gold); color: var(--gold); }

  .hero-stats {
    position: absolute; bottom: 48px; right: 0; z-index: 2;
    display: flex; gap: 1px;
    animation: fadeUp .8s .8s var(--ease) both;
  }
  .stat {
    background: rgba(255,255,255,.04);
    border: 1px solid rgba(255,255,255,.07);
    padding: 20px 28px; text-align: center; backdrop-filter: blur(8px);
  }
  .stat-num {
    font-family: var(--font-display);
    font-size: 26px; font-weight: 700; color: var(--gold);
  }
  .stat-label { font-size: 11px; letter-spacing: .12em; text-transform: uppercase; color: var(--muted); margin-top: 4px; }

  /* ── MARQUEE STRIP ── */
  .marquee-strip {
    background: var(--gold); padding: 12px 0; overflow: hidden;
    position: relative; z-index: 3;
  }
  .marquee-track {
    display: flex; gap: 0;
    animation: marquee 22s linear infinite;
    white-space: nowrap;
  }
  .marquee-track span {
    color: #0a0a0a; font-size: 12px; font-weight: 500; letter-spacing: .14em; text-transform: uppercase;
    padding: 0 36px;
  }
  .marquee-track span::before { content: '◆'; margin-right: 36px; }
  @keyframes marquee { from { transform: translateX(0); } to { transform: translateX(-50%); } }

  /* ── SECTIONS ── */
  .section { padding: 100px 0; }
  .section-label {
    display: flex; align-items: center; gap: 12px;
    font-size: 11px; letter-spacing: .2em; text-transform: uppercase; color: var(--gold);
    margin-bottom: 16px;
  }
  .section-label::after { content: ''; flex: 1; height: 1px; background: rgba(201,168,76,.2); }
  .section-title {
    font-family: var(--font-display);
    font-size: clamp(32px, 4vw, 52px);
    font-weight: 700; line-height: 1.1; letter-spacing: -.02em;
    margin-bottom: 12px;
  }
  .section-sub { color: var(--muted); font-size: 15px; line-height: 1.6; }

  /* ── CATEGORIES ── */
  .cat-grid {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 12px; margin-top: 52px;
  }
  .cat-card {
    background: var(--dark2);
    border: 1px solid rgba(255,255,255,.05);
    border-radius: var(--radius);
    padding: 28px 16px;
    text-align: center; cursor: pointer;
    transition: all .3s var(--ease);
    position: relative; overflow: hidden;
  }
  .cat-card::before {
    content: '';
    position: absolute; bottom: 0; left: 0; right: 0; height: 2px;
    background: var(--gold);
    transform: scaleX(0); transform-origin: left;
    transition: transform .3s var(--ease);
  }
  .cat-card:hover {
    background: rgba(201,168,76,.07);
    border-color: rgba(201,168,76,.25);
    transform: translateY(-6px);
  }
  .cat-card:hover::before { transform: scaleX(1); }
  .cat-card .icon {
    font-size: 26px; color: var(--gold); margin-bottom: 12px;
    display: block; transition: transform .3s var(--ease);
  }
  .cat-card:hover .icon { transform: scale(1.18); }
  .cat-card h4 { font-size: 13px; font-weight: 500; letter-spacing: .06em; text-transform: uppercase; }
  .cat-card .sub { font-size: 11px; color: var(--muted); margin-top: 4px; }

  /* ── PRODUCTS ── */
  .prod-header { display: flex; align-items: flex-end; justify-content: space-between; margin-bottom: 52px; }
  .prod-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 2px;
  }
  .product-card {
    background: var(--dark);
    position: relative; overflow: hidden;
    cursor: pointer;
  }
  .product-card::after {
    content: '';
    position: absolute; inset: 0;
    border: 1px solid transparent;
    transition: border-color .3s;
    pointer-events: none; z-index: 3;
  }
  .product-card:hover::after { border-color: var(--gold); }

  .product-img-wrap { position: relative; overflow: hidden; }
  .product-img-wrap img {
    width: 100%; height: 280px; object-fit: cover; display: block;
    transition: transform .6s var(--ease);
  }
  .product-card:hover .product-img-wrap img { transform: scale(1.08); }

  .product-badge {
    position: absolute; top: 14px; left: 14px; z-index: 2;
    background: var(--gold); color: #0a0a0a;
    font-size: 10px; font-weight: 700; letter-spacing: .1em; text-transform: uppercase;
    padding: 5px 10px; border-radius: 1px;
  }
  .product-badge.sale { background: #c0392b; color: white; }

  .product-actions {
    position: absolute; top: 14px; right: 14px; z-index: 2;
    display: flex; flex-direction: column; gap: 6px;
    opacity: 0; transform: translateX(10px);
    transition: all .3s var(--ease);
  }
  .product-card:hover .product-actions { opacity: 1; transform: none; }
  .prod-act-btn {
    width: 34px; height: 34px;
    background: rgba(10,10,10,.85); border: 1px solid rgba(255,255,255,.1);
    color: var(--white); font-size: 13px; cursor: pointer;
    display: grid; place-items: center; border-radius: 2px;
    transition: background .2s, border-color .2s;
    backdrop-filter: blur(4px);
  }
  .prod-act-btn:hover { background: var(--gold); border-color: var(--gold); color: #0a0a0a; }

  .product-body { padding: 18px 18px 14px; }
  .product-cat { font-size: 10px; letter-spacing: .14em; text-transform: uppercase; color: var(--gold); margin-bottom: 6px; }
  .product-name { font-family: var(--font-display); font-size: 17px; font-weight: 700; line-height: 1.3; margin-bottom: 12px; }
  .product-price-row { display: flex; align-items: center; justify-content: space-between; }
  .product-price { font-size: 18px; font-weight: 500; }
  .product-old-price { font-size: 13px; color: var(--muted); text-decoration: line-through; margin-left: 8px; }
  .product-rating { font-size: 11px; color: #f0b429; }

  .add-to-cart-btn {
    width: 100%;
    background: rgba(255,255,255,.04); border: 1px solid rgba(255,255,255,.07);
    color: var(--white);
    padding: 12px; margin: 2px 0 0;
    font-family: var(--font-body);
    font-size: 12px; font-weight: 500; letter-spacing: .1em; text-transform: uppercase;
    cursor: pointer;
    transition: background .25s, border-color .25s, color .25s;
  }
  .add-to-cart-btn:hover { background: var(--gold); border-color: var(--gold); color: #0a0a0a; }

  /* ── DEAL BANNER ── */
  .deal-section {
    padding: 0 0 100px;
  }
  .deal-inner {
    display: grid; grid-template-columns: 1fr 1fr;
    position: relative; overflow: hidden;
    border: 1px solid rgba(201,168,76,.15);
  }
  .deal-img-side { position: relative; overflow: hidden; min-height: 540px; }
  .deal-img-side img {
    position: absolute; inset: 0;
    width: 100%; height: 100%; object-fit: cover;
    filter: brightness(.75) saturate(.9);
    transition: transform .8s var(--ease);
  }
  .deal-inner:hover .deal-img-side img { transform: scale(1.04); }
  .deal-img-side::after {
    content: '';
    position: absolute; inset: 0;
    background: linear-gradient(to right, transparent 60%, rgba(17,17,17,1));
  }

  .deal-content {
    background: var(--dark); padding: 60px 52px;
    display: flex; flex-direction: column; justify-content: center;
  }
  .deal-eyebrow {
    display: flex; align-items: center; gap: 10px;
    font-size: 10px; letter-spacing: .2em; text-transform: uppercase;
    color: #c0392b; margin-bottom: 20px;
  }
  .deal-pulse {
    width: 8px; height: 8px; background: #c0392b; border-radius: 50%;
    animation: pulse 1.5s ease-in-out infinite;
  }
  @keyframes pulse { 0%,100% { box-shadow: 0 0 0 0 rgba(192,57,43,.6); } 50% { box-shadow: 0 0 0 8px rgba(192,57,43,0); } }

  .deal-title {
    font-family: var(--font-display);
    font-size: clamp(36px, 4vw, 54px);
    font-weight: 900; line-height: 1.05;
    margin-bottom: 16px;
  }
  .deal-title em { font-style: italic; color: var(--gold); }
  .deal-desc { color: rgba(250,250,250,.6); font-size: 15px; line-height: 1.7; margin-bottom: 32px; }

  .timer { display: flex; gap: 10px; margin-bottom: 36px; }
  .time-box {
    background: rgba(255,255,255,.03);
    border: 1px solid rgba(201,168,76,.15);
    padding: 16px 20px; text-align: center; min-width: 72px;
  }
  .time-num {
    font-family: var(--font-display);
    font-size: 28px; font-weight: 700; color: var(--gold);
    line-height: 1; display: block;
  }
  .time-label { font-size: 9px; letter-spacing: .15em; text-transform: uppercase; color: var(--muted); margin-top: 4px; display: block; }

  .deal-price-row { display: flex; align-items: center; gap: 16px; margin-bottom: 28px; }
  .deal-price { font-family: var(--font-display); font-size: 38px; font-weight: 700; }
  .deal-old { color: var(--muted); text-decoration: line-through; font-size: 20px; }
  .deal-off {
    background: #c0392b; color: white;
    font-size: 12px; font-weight: 700; letter-spacing: .05em;
    padding: 6px 12px; border-radius: 2px;
  }
  .deal-stock { color: var(--muted); font-size: 13px; margin-bottom: 28px; }
  .deal-stock span { color: var(--gold); }

  /* ── TESTIMONIALS ── */
  .testimonials-grid {
    display: grid; grid-template-columns: repeat(3, 1fr);
    gap: 2px; margin-top: 52px;
  }
  .testimonial-card {
    background: var(--dark); padding: 36px 32px;
    border-top: 2px solid transparent;
    transition: border-color .3s, background .3s;
  }
  .testimonial-card:hover { border-top-color: var(--gold); background: var(--dark2); }
  .test-quote {
    font-family: var(--font-display);
    font-size: 42px; color: var(--gold); line-height: 0.8;
    margin-bottom: 16px; opacity: .5;
  }
  .test-text {
    font-size: 15px; line-height: 1.75; color: rgba(250,250,250,.75);
    margin-bottom: 24px;
  }
  .test-author { display: flex; align-items: center; gap: 12px; }
  .test-avatar {
    width: 44px; height: 44px; border-radius: 50%; object-fit: cover;
    border: 2px solid rgba(201,168,76,.3);
  }
  .test-name { font-weight: 500; font-size: 14px; }
  .test-role { font-size: 12px; color: var(--muted); margin-top: 2px; }
  .test-stars { color: #f0b429; font-size: 12px; margin-bottom: 4px; }

  /* ── NEWSLETTER ── */
  .newsletter-section { padding: 0 0 100px; }
  .newsletter-inner {
    position: relative; overflow: hidden;
    background: linear-gradient(135deg, #1a1500 0%, #0d0d0d 50%, #001a1a 100%);
    border: 1px solid rgba(201,168,76,.15);
    padding: 80px; text-align: center;
  }
  .newsletter-inner::before {
    content: '';
    position: absolute; top: -100px; left: 50%; transform: translateX(-50%);
    width: 600px; height: 600px;
    background: radial-gradient(circle, rgba(201,168,76,.06) 0%, transparent 70%);
    pointer-events: none;
  }
  .newsletter-title {
    font-family: var(--font-display);
    font-size: clamp(32px, 4vw, 52px);
    font-weight: 700; margin-bottom: 14px;
  }
  .newsletter-sub { color: var(--muted); font-size: 16px; margin-bottom: 40px; }
  .newsletter-form {
    display: flex; gap: 0; justify-content: center; max-width: 520px; margin: 0 auto;
  }
  .newsletter-form input {
    flex: 1; background: rgba(255,255,255,.05);
    border: 1px solid rgba(255,255,255,.1); border-right: none;
    padding: 14px 20px; color: var(--white); font-family: var(--font-body);
    font-size: 14px; outline: none; border-radius: 0;
    transition: border-color .2s;
  }
  .newsletter-form input:focus { border-color: var(--gold); }
  .newsletter-form input::placeholder { color: var(--muted); }
  #newsletterMsg { margin-top: 14px; font-size: 14px; color: var(--gold); }

  /* ── FOOTER ── */
  footer {
    background: var(--dark); border-top: 1px solid rgba(255,255,255,.05);
    padding: 64px 0 32px;
  }
  .footer-grid {
    display: grid; grid-template-columns: 1.8fr repeat(3, 1fr);
    gap: 48px; margin-bottom: 52px;
  }
  .footer-brand {
    font-family: var(--font-display);
    font-size: 22px; font-weight: 900;
    margin-bottom: 14px;
  }
  .footer-brand .dot { color: var(--gold); }
  .footer-about { color: var(--muted); font-size: 14px; line-height: 1.7; margin-bottom: 24px; }
  .social-row { display: flex; gap: 8px; }
  .social-btn {
    width: 36px; height: 36px;
    background: rgba(255,255,255,.04); border: 1px solid rgba(255,255,255,.07);
    color: var(--muted); font-size: 13px; cursor: pointer;
    display: grid; place-items: center; border-radius: 2px;
    transition: all .2s;
  }
  .social-btn:hover { background: var(--gold); border-color: var(--gold); color: #0a0a0a; }
  .footer-heading { font-size: 12px; letter-spacing: .14em; text-transform: uppercase; margin-bottom: 18px; color: var(--white); }
  .footer-links { list-style: none; }
  .footer-links li { margin-bottom: 10px; }
  .footer-links a { color: var(--muted); font-size: 14px; transition: color .2s; }
  .footer-links a:hover { color: var(--gold); }
  .footer-bottom {
    border-top: 1px solid rgba(255,255,255,.05);
    padding-top: 24px;
    display: flex; justify-content: space-between; align-items: center;
    color: rgba(255,255,255,.3); font-size: 13px;
  }

  /* ── SCROLLED STATE ── */
  .reveal { opacity: 0; transform: translateY(32px); transition: opacity .7s var(--ease), transform .7s var(--ease); }
  .reveal.visible { opacity: 1; transform: none; }

  /* ── MOBILE ── */
  .mobile-toggle { display: none; }

  @media (max-width: 1100px) {
    .cat-grid { grid-template-columns: repeat(3, 1fr); }
    .prod-grid { grid-template-columns: repeat(3, 1fr); }
    .footer-grid { grid-template-columns: 1fr 1fr; }
  }
  @media (max-width: 900px) {
    nav { display: none; }
    .mobile-toggle {
      display: flex; background: none; border: 1px solid rgba(255,255,255,.1);
      color: var(--white); padding: 8px 12px; cursor: pointer; border-radius: 2px;
      align-items: center; gap: 6px; font-size: 12px; letter-spacing: .06em;
    }
    .prod-grid { grid-template-columns: repeat(2, 1fr); }
    .deal-inner { grid-template-columns: 1fr; }
    .deal-img-side { min-height: 300px; }
    .testimonials-grid { grid-template-columns: 1fr; }
    .newsletter-inner { padding: 52px 28px; }
    .hero-stats { display: none; }
  }
  @media (max-width: 600px) {
    .cat-grid { grid-template-columns: repeat(2, 1fr); }
    .prod-grid { grid-template-columns: 1fr; }
    .footer-grid { grid-template-columns: 1fr; }
    .hero h1 { font-size: 42px; }
    .deal-content { padding: 36px 24px; }
    .search-wrap { display: none; }
  }
</style>
</head>
<body>

<!-- HEADER -->
<header id="siteHeader">
  <div class="container header-inner">
    <div style="display:flex;align-items:center;gap:16px">
      <button class="mobile-toggle" id="mobileToggle"><i class="fas fa-bars"></i> Menu</button>
      <a class="brand" href="#">Nexus<span class="dot">·</span>Shop</a>
    </div>
    <nav>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#categories">Collections</a></li>
        <li><a href="#products">Trending</a></li>
        <li><a href="#deals">Deals</a></li>
        <li><a href="#about">About</a></li>
      </ul>
    </nav>
    <div class="header-right">
      <div class="search-wrap">
        <i class="fas fa-search" style="color:var(--muted);font-size:13px"></i>
        <input type="search" id="searchInput" placeholder="Search products…"/>
      </div>
      <button class="icon-btn" title="Account"><i class="far fa-user"></i></button>
      <button class="icon-btn" title="Wishlist"><i class="far fa-heart"></i></button>
      <button class="cart-btn" id="cartBtn" title="Cart">
        <i class="fas fa-shopping-bag"></i>
        <span class="cart-count" id="cartCount">0</span>
      </button>
    </div>
  </div>
</header>

<!-- MOBILE NAV -->
<div id="mobileMenu" style="display:none;position:fixed;inset:0;z-index:200;background:rgba(10,10,10,.97);padding:80px 32px 32px">
  <button id="closeMenu" style="position:absolute;top:24px;right:28px;background:none;border:none;color:white;font-size:22px;cursor:pointer"><i class="fas fa-times"></i></button>
  <nav><ul style="list-style:none;display:flex;flex-direction:column;gap:0">
    <li style="border-bottom:1px solid rgba(255,255,255,.07)"><a href="#" style="display:block;padding:18px 0;font-family:var(--font-display);font-size:28px;font-weight:700">Home</a></li>
    <li style="border-bottom:1px solid rgba(255,255,255,.07)"><a href="#categories" style="display:block;padding:18px 0;font-family:var(--font-display);font-size:28px;font-weight:700">Collections</a></li>
    <li style="border-bottom:1px solid rgba(255,255,255,.07)"><a href="#products" style="display:block;padding:18px 0;font-family:var(--font-display);font-size:28px;font-weight:700">Trending</a></li>
    <li style="border-bottom:1px solid rgba(255,255,255,.07)"><a href="#deals" style="display:block;padding:18px 0;font-family:var(--font-display);font-size:28px;font-weight:700">Deals</a></li>
  </ul></nav>
</div>

<main>
<!-- HERO -->
<section class="hero">
  <div class="hero-bg"></div>
  <div class="container" style="position:relative;z-index:2;width:100%">
    <div class="hero-content">
      <div class="hero-eyebrow">New Season Collection</div>
      <h1>Harshi<br><em>Curated</em><br>for You</h1>
      <p>Discover premium fashion, technology & accessories — meticulously curated. Limited-time deals and free shipping on selected items.</p>
      <div class="hero-cta">
        <button class="btn btn-gold" id="shopNow">Shop Now <i class="fas fa-arrow-right"></i></button>
        <button class="btn btn-outline" id="exploreDeals">Explore Deals</button>
      </div>
    </div>
  </div>
  <div class="hero-stats container" style="position:absolute;bottom:48px;right:32px;z-index:2;display:flex;gap:1px">
    <div class="stat"><div class="stat-num">50K+</div><div class="stat-label">Products</div></div>
    <div class="stat"><div class="stat-num">4.9★</div><div class="stat-label">Rating</div></div>
    <div class="stat"><div class="stat-num">120+</div><div class="stat-label">Brands</div></div>
  </div>
</section>

<!-- MARQUEE -->
<div class="marquee-strip">
  <div class="marquee-track" id="marqueeTrack">
    <span>Free Shipping Over $99</span><span>New Arrivals Daily</span><span>Up to 40% Off This Week</span>
    <span>Secure Checkout</span><span>Premium Quality</span><span>Free Returns</span>
    <span>Free Shipping Over $99</span><span>New Arrivals Daily</span><span>Up to 40% Off This Week</span>
    <span>Secure Checkout</span><span>Premium Quality</span><span>Free Returns</span>
  </div>
</div>

<!-- CATEGORIES -->
<section class="section container reveal" id="categories">
  <div>
    <div class="section-label">Browse</div>
    <div style="display:flex;align-items:flex-end;justify-content:space-between;flex-wrap:wrap;gap:16px">
      <div>
        <h2 class="section-title">Shop by Category</h2>
        <p class="section-sub">Explore our curated range across every lifestyle.</p>
      </div>
      <a href="#" style="font-size:12px;letter-spacing:.1em;text-transform:uppercase;color:var(--gold);border-bottom:1px solid rgba(201,168,76,.3);padding-bottom:2px">View All <i class="fas fa-arrow-right" style="font-size:10px"></i></a>
    </div>
  </div>
  <div class="cat-grid" id="categoriesGrid"></div>
</section>

<!-- PRODUCTS -->
<section class="section container reveal" id="products" style="padding-top:0">
  <div class="prod-header">
    <div>
      <div class="section-label">Featured</div>
      <h2 class="section-title">Trending Now</h2>
    </div>
    <div style="display:flex;gap:8px" id="filterBtns"></div>
  </div>
  <div class="prod-grid" id="productsGrid"></div>
</section>

<!-- DEALS -->
<section class="deal-section container reveal" id="deals">
  <div class="section-label">Flash Sale</div>
  <div class="deal-inner">
    <div class="deal-img-side">
      <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=900&q=85" alt="MacBook Air M2">
    </div>
    <div class="deal-content">
      <div class="deal-eyebrow"><div class="deal-pulse"></div> Live Deal — Limited Stock</div>
      <h2 class="deal-title">MacBook Air<br><em>M2 Chip</em></h2>
      <p class="deal-desc">Thin, light and extraordinarily powerful. M2 performance in the world's most loved laptop form factor.</p>
      <div class="timer">
        <div class="time-box"><span class="time-num" id="dealDays">0</span><span class="time-label">Days</span></div>
        <div class="time-box"><span class="time-num" id="dealHours">00</span><span class="time-label">Hours</span></div>
        <div class="time-box"><span class="time-num" id="dealMinutes">00</span><span class="time-label">Mins</span></div>
        <div class="time-box"><span class="time-num" id="dealSeconds">00</span><span class="time-label">Secs</span></div>
      </div>
      <div class="deal-price-row">
        <div class="deal-price">$999</div>
        <div class="deal-old">$1,199</div>
        <div class="deal-off">−17%</div>
      </div>
      <p class="deal-stock">Only <span>12 items</span> left at this price</p>
      <button class="btn btn-gold" id="buyDeal">Add to Cart <i class="fas fa-shopping-bag"></i></button>
    </div>
  </div>
</section>

<!-- TESTIMONIALS -->
<section class="section container reveal">
  <div class="section-label">Reviews</div>
  <h2 class="section-title">Loved by Thousands</h2>
  <p class="section-sub">Real words from real buyers.</p>
  <div class="testimonials-grid">
    <div class="testimonial-card">
      <div class="test-quote">"</div>
      <div class="test-stars">★★★★★</div>
      <p class="test-text">Fast shipping and exceptional customer service. The product quality blew me away — easily worth every penny.</p>
      <div class="test-author">
        <img class="test-avatar" src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80" alt="Ava">
        <div><div class="test-name">Ava Martin</div><div class="test-role">Verified Buyer</div></div>
      </div>
    </div>
    <div class="testimonial-card">
      <div class="test-quote">"</div>
      <div class="test-stars">★★★★☆</div>
      <p class="test-text">The selection is incredible. Found exactly what I was looking for within minutes. Checkout was smooth and intuitive.</p>
      <div class="test-author">
        <img class="test-avatar" src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=80&q=80" alt="Michael">
        <div><div class="test-name">Michael Lee</div><div class="test-role">Frequent Buyer</div></div>
      </div>
    </div>
    <div class="testimonial-card">
      <div class="test-quote">"</div>
      <div class="test-stars">★★★★★</div>
      <p class="test-text">Premium experience from browse to delivery. The packaging alone felt luxurious. This is my go-to shop now.</p>
      <div class="test-author">
        <img class="test-avatar" src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&w=80&q=80" alt="Sara">
        <div><div class="test-name">Sara Chen</div><div class="test-role">First-time Buyer</div></div>
      </div>
    </div>
  </div>
</section>

<!-- NEWSLETTER -->
<section class="newsletter-section container reveal" id="about">
  <div class="newsletter-inner">
    <div class="section-label" style="justify-content:center">Exclusive Access</div>
    <h2 class="newsletter-title">Stay in the Loop</h2>
    <p class="newsletter-sub">Get exclusive offers, early access to drops & new arrivals — straight to your inbox.</p>
    <div class="newsletter-form">
      <input type="email" id="newsletterEmail" placeholder="your@email.com">
      <button class="btn btn-gold" id="subscribeBtn">Subscribe</button>
    </div>
    <div id="newsletterMsg"></div>
  </div>
</section>
</main>

<!-- FOOTER -->
<footer>
  <div class="container">
    <div class="footer-grid">
      <div>
        <div class="footer-brand">Nexus<span class="dot">·</span>Shop</div>
        <p class="footer-about">A modern premium e-commerce experience built with passion for design and love for quality products.</p>
        <div class="social-row">
          <a class="social-btn" href="#"><i class="fab fa-instagram"></i></a>
          <a class="social-btn" href="#"><i class="fab fa-twitter"></i></a>
          <a class="social-btn" href="#"><i class="fab fa-facebook"></i></a>
          <a class="social-btn" href="#"><i class="fab fa-pinterest"></i></a>
        </div>
      </div>
      <div>
        <div class="footer-heading">Company</div>
        <ul class="footer-links">
          <li><a href="#">About Us</a></li>
          <li><a href="#">Careers</a></li>
          <li><a href="#">Press</a></li>
          <li><a href="#">Sustainability</a></li>
        </ul>
      </div>
      <div>
        <div class="footer-heading">Support</div>
        <ul class="footer-links">
          <li><a href="#">Help Center</a></li>
          <li><a href="#">Shipping & Returns</a></li>
          <li><a href="#">Track Order</a></li>
          <li><a href="#">Contact Us</a></li>
        </ul>
      </div>
      <div>
        <div class="footer-heading">Shop</div>
        <ul class="footer-links">
          <li><a href="#">New Arrivals</a></li>
          <li><a href="#">Best Sellers</a></li>
          <li><a href="#">Sale</a></li>
          <li><a href="#">Gift Cards</a></li>
        </ul>
      </div>
    </div>
    <div class="footer-bottom">
      <div>© <span id="year"></span> NexusShop. All rights reserved.</div>
      <div style="display:flex;gap:20px">
        <a href="#" style="color:rgba(255,255,255,.3)">Privacy</a>
        <a href="#" style="color:rgba(255,255,255,.3)">Terms</a>
        <a href="#" style="color:rgba(255,255,255,.3)">Cookies</a>
      </div>
    </div>
  </div>
</footer>

<script>
const CATEGORIES = [
  { id: 'phones',      name: 'Smartphones',  icon: 'fa-mobile-alt' },
  { id: 'laptops',     name: 'Laptops',       icon: 'fa-laptop' },
  { id: 'clothing',    name: 'Clothing',      icon: 'fa-tshirt' },
  { id: 'gadgets',     name: 'Gadgets',       icon: 'fa-headphones' },
  { id: 'footwear',    name: 'Footwear',      icon: 'fa-shoe-prints' },
  { id: 'accessories', name: 'Accessories',   icon: 'fa-watch' }
];

const PRODUCTS = [
  { id:1, title:'iPhone 14 Pro Max', price:1099, oldPrice:1199, rating:5, reviews:128, badge:'New', img:'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80', category:'phones' },
  { id:2, title:'MacBook Pro 14"',   price:1999, rating:4, reviews:86, img:'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80', category:'laptops' },
  { id:3, title:'Apple Watch Series 8', price:349, oldPrice:399, rating:5, reviews:214, badge:'Sale', img:'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80', category:'accessories' },
  { id:4, title:'Nike Air Max 270',  price:150, rating:4, reviews:53, img:'https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80', category:'footwear' },
  { id:5, title:'Sony A7 IV Camera', price:2499, rating:5, reviews:42, img:'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80', category:'gadgets' },
  { id:6, title:'Chanel No. 5',      price:120, rating:5, reviews:189, img:'https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80', category:'accessories' },
  { id:7, title:'Travel Backpack',   price:79, oldPrice:99, rating:4, reviews:67, img:'https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80', category:'accessories' },
  { id:8, title:'Sony WH-1000XM5',  price:399, rating:5, reviews:156, img:'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80', category:'gadgets' }
];

let cartCount = 0;

// ── Render Categories ──
function renderCategories() {
  const grid = document.getElementById('categoriesGrid');
  grid.innerHTML = '';
  CATEGORIES.forEach(cat => {
    const el = document.createElement('div');
    el.className = 'cat-card';
    el.innerHTML = `<span class="icon"><i class="fas ${cat.icon}"></i></span><h4>${cat.name}</h4><div class="sub">Explore →</div>`;
    el.addEventListener('click', () => {
      filterProducts(cat.id);
      document.getElementById('searchInput').value = cat.name;
      document.getElementById('products').scrollIntoView({ behavior:'smooth', block:'start' });
    });
    grid.appendChild(el);
  });
}

// ── Render Products ──
function renderProducts(list) {
  const grid = document.getElementById('productsGrid');
  grid.innerHTML = '';
  list.forEach(p => {
    const el = document.createElement('article');
    el.className = 'product-card';
    const badgeHtml = p.badge ? `<div class="product-badge ${p.badge === 'Sale' ? 'sale' : ''}">${p.badge}</div>` : '';
    el.innerHTML = `
      <div class="product-img-wrap">
        ${badgeHtml}
        <div class="product-actions">
          <button class="prod-act-btn" title="Wishlist"><i class="far fa-heart"></i></button>
          <button class="prod-act-btn" title="Quick view"><i class="far fa-eye"></i></button>
        </div>
        <img src="${p.img}" alt="${p.title}" loading="lazy">
      </div>
      <div class="product-body">
        <div class="product-cat">${p.category}</div>
        <div class="product-name">${p.title}</div>
        <div class="product-price-row">
          <div>
            <span class="product-price">$${p.price.toLocaleString()}</span>
            ${p.oldPrice ? `<span class="product-old-price">$${p.oldPrice.toLocaleString()}</span>` : ''}
          </div>
          <div class="product-rating">${'★'.repeat(Math.round(p.rating))} <span style="color:var(--muted);font-size:11px">(${p.reviews})</span></div>
        </div>
      </div>
      <button class="add-to-cart-btn" data-id="${p.id}"><i class="fas fa-shopping-bag"></i> &nbsp;Add to Cart</button>
    `;
    grid.appendChild(el);
  });

  grid.querySelectorAll('.add-to-cart-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      const id = Number(btn.dataset.id);
      addToCart(id, btn);
    });
  });
}

function addToCart(id, btn) {
  cartCount++;
  document.getElementById('cartCount').textContent = cartCount;
  if (btn) {
    btn.textContent = '✓  Added';
    btn.style.background = 'var(--gold)';
    btn.style.color = '#0a0a0a';
    btn.disabled = true;
    setTimeout(() => {
      btn.innerHTML = '<i class="fas fa-shopping-bag"></i> &nbsp;Add to Cart';
      btn.style.background = '';
      btn.style.color = '';
      btn.disabled = false;
    }, 1400);
  }
}

function filterProducts(query) {
  const q = (query || '').trim().toLowerCase();
  const filtered = q ? PRODUCTS.filter(p => p.title.toLowerCase().includes(q) || p.category.toLowerCase().includes(q)) : PRODUCTS;
  renderProducts(filtered);
}

// ── Filter Buttons ──
function renderFilterBtns() {
  const wrap = document.getElementById('filterBtns');
  const filters = ['All', ...CATEGORIES.map(c => c.name)];
  filters.forEach((f, i) => {
    const btn = document.createElement('button');
    btn.textContent = f;
    btn.style.cssText = `background:${i===0?'var(--gold)':'rgba(255,255,255,.04)'};color:${i===0?'#0a0a0a':'var(--muted)'};border:1px solid ${i===0?'var(--gold)':'rgba(255,255,255,.08)'};padding:8px 16px;border-radius:2px;cursor:pointer;font-size:12px;letter-spacing:.06em;text-transform:uppercase;font-family:var(--font-body);transition:all .2s`;
    btn.addEventListener('click', () => {
      wrap.querySelectorAll('button').forEach(b => {
        b.style.background = 'rgba(255,255,255,.04)';
        b.style.color = 'var(--muted)';
        b.style.borderColor = 'rgba(255,255,255,.08)';
      });
      btn.style.background = 'var(--gold)';
      btn.style.color = '#0a0a0a';
      btn.style.borderColor = 'var(--gold)';
      filterProducts(f === 'All' ? '' : CATEGORIES.find(c => c.name === f)?.id || f);
    });
    wrap.appendChild(btn);
  });
}

// ── Search ──
document.getElementById('searchInput').addEventListener('input', e => filterProducts(e.target.value));

// ── Header scroll ──
window.addEventListener('scroll', () => {
  document.getElementById('siteHeader').classList.toggle('scrolled', window.scrollY > 50);
});

// ── Mobile menu ──
document.getElementById('mobileToggle').addEventListener('click', () => {
  document.getElementById('mobileMenu').style.display = 'flex';
});
document.getElementById('closeMenu').addEventListener('click', () => {
  document.getElementById('mobileMenu').style.display = 'none';
});
document.getElementById('mobileMenu').querySelectorAll('a').forEach(a => {
  a.addEventListener('click', () => document.getElementById('mobileMenu').style.display = 'none');
});

// ── Deal countdown ──
(function() {
  const target = new Date(Date.now() + (24*60 + 36)*60*1000);
  function tick() {
    const diff = target - Date.now();
    if (diff <= 0) return;
    const d = Math.floor(diff / 86400000);
    const h = Math.floor((diff % 86400000) / 3600000);
    const m = Math.floor((diff % 3600000) / 60000);
    const s = Math.floor((diff % 60000) / 1000);
    document.getElementById('dealDays').textContent = d;
    document.getElementById('dealHours').textContent = String(h).padStart(2,'0');
    document.getElementById('dealMinutes').textContent = String(m).padStart(2,'0');
    document.getElementById('dealSeconds').textContent = String(s).padStart(2,'0');
  }
  tick(); setInterval(tick, 1000);
})();

// ── Newsletter ──
document.getElementById('subscribeBtn').addEventListener('click', () => {
  const email = document.getElementById('newsletterEmail').value.trim();
  const msg = document.getElementById('newsletterMsg');
  if (!email.includes('@')) {
    msg.textContent = 'Please enter a valid email.';
    msg.style.color = '#c0392b';
  } else {
    msg.textContent = '✓  Welcome to the inner circle!';
    msg.style.color = 'var(--gold)';
    document.getElementById('newsletterEmail').value = '';
    setTimeout(() => msg.textContent = '', 3500);
  }
});

// ── Buy deal ──
document.getElementById('buyDeal').addEventListener('click', () => {
  cartCount++;
  document.getElementById('cartCount').textContent = cartCount;
  const btn = document.getElementById('buyDeal');
  btn.innerHTML = '✓ Added to Cart';
  setTimeout(() => btn.innerHTML = 'Add to Cart <i class="fas fa-shopping-bag"></i>', 1500);
});

// ── Smooth scroll buttons ──
document.getElementById('shopNow').addEventListener('click', () =>
  document.getElementById('products').scrollIntoView({ behavior: 'smooth' }));
document.getElementById('exploreDeals').addEventListener('click', () =>
  document.getElementById('deals').scrollIntoView({ behavior: 'smooth' }));

// ── Reveal on scroll ──
const observer = new IntersectionObserver(entries => {
  entries.forEach(e => { if (e.isIntersecting) e.target.classList.add('visible'); });
}, { threshold: 0.1 });
document.querySelectorAll('.reveal').forEach(el => observer.observe(el));

// ── Init ──
(function init() {
  renderCategories();
  renderProducts(PRODUCTS);
  renderFilterBtns();
  document.getElementById('year').textContent = new Date().getFullYear();
})();
</script>
</body>
</html>
