<script>
  import "./tictactoe.css";
  import Tabs from "./Tabs.svelte";

  const tabs = [
    {
      id: 1,
      title: "Tab 1",
      content: "This is the content of Tab 1.",
    },
    {
      id: 2,
      title: "Tab 2",
      content: "This is the content of Tab 2.",
    },
    {
      id: 3,
      title: "Tab 3",
      content: "This is the content of Tab 3.",
    },
  ];
</script>

<div class="gameboard-container">
  <div class="container mx-auto mt-10">
    <Tabs {tabs} />
  </div>
  <!-- <div class="flex align-center border">
    <div class="board-container border">
      <div class="crossVerticalLeft" />
      <div class="crossVerticalRight" />
      <div class="crossHorizontalTop" />
      <div class="crossHorizontalBottom" />
      <div class="o00" />
      <div class="o01" />
      <div class="o02" />
      <div class="o10" />
      <div class="o11" />
      <div class="o12" />
      <div class="o20" />
      <div class="o21" />
      <div class="o22" />
      <div class="x00Left" />
      <div class="x00Right" />
      <div class="x01Left" />
      <div class="x01Right" />
      <div class="x02Left" />
      <div class="x02Right" />
      <div class="x10Left" />
      <div class="x10Right" />
      <div class="x11Left" />
      <div class="x11Right" />
      <div class="x12Left" />
      <div class="x12Right" />
      <div class="x20Left" />
      <div class="x20Right" />
      <div class="x21Left" />
      <div class="x21Right" />
      <div class="x22Left" />
      <div class="x22Right" />
    </div>
  </div> -->
</div>
