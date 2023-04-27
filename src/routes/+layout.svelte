<script>
  import Nav from "./Nav.svelte";
  import "./app.postcss";
</script>

<div class="homepage h-full" style="height: 100vh;">
  <Nav />
  <slot />
</div>
