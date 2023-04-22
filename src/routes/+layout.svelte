<script>
  import Nav from "./Nav.svelte";
  import "./app.postcss";
</script>

<div
  class="homepage border h-full"
  style="border: 2px solid cyan; height: 100vh;"
>
  <Nav />
  <slot />
</div>
