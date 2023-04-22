<div class="gameboard-container border" style="border; 4px solid green;">
  <div class="container">
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
</div>

<style>
  :root {
    --a: #f9f1ed;
    --b: #e4c5b7;
    --c: #f2e2db;
    --d: #c88b6f;
    --e: #377490;
  }

  /* .container {
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
    height: 300px;
    width: 300px;
    flex-direction: column;
  } */
  .crossVerticalLeft {
    width: 8px;
    position: absolute;
    height: 100%;
    left: 95px;
    background: var(--b);
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }
  .crossHorizontalTop {
    width: 100%;
    position: absolute;
    height: 8px;
    top: 95px;
    background: var(--b);
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }
  .crossHorizontalBottom {
    width: 100%;
    position: absolute;
    height: 8px;
    top: 195px;
    background: var(--b);
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }
  .crossVerticalRight {
    width: 8px;
    position: absolute;
    left: 195px;
    height: 100%;
    background: var(--b);
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .o00 {
    position: absolute;
    border: 25px solid var(--c);
    top: 10px;
    left: 10px;
    border-radius: 100px;
    height: 30px;
    width: 30px;
  }

  .o01 {
    position: absolute;
    border: 25px solid var(--c);
    top: 10px;
    left: 110px;
    border-radius: 100px;
    height: 30px;
    width: 30px;
  }

  .o02 {
    position: absolute;
    border: 25px solid var(--c);
    top: 10;
    left: 210;
    border-radius: 100px;
    height: 30px;
    width: 30px;
  }

  .o10 {
    position: absolute;
    border: 25px solid var(--c);
    top: 110px;
    left: 10px;
    border-radius: 100px;
    height: 30px;
    width: 30px;
  }

  .o11 {
    position: absolute;
    border: 25px solid var(--c);
    top: 110px;
    left: 110px;
    border-radius: 100px;
    height: 30px;
    width: 30px;
  }

  .o12 {
    position: absolute;
    border: 25px solid var(--c);
    top: 110;
    left: 210;
    border-radius: 100px;
    height: 30px;
    width: 30px;
  }

  .o20 {
    position: absolute;
    border: 25px solid var(--c);
    top: 210px;
    left: 10px;
    border-radius: 100px;
    height: 30px;
    width: 30px;
  }

  .o21 {
    position: absolute;
    border: 25px solid var(--c);
    top: 210px;
    left: 110px;
    border-radius: 100px;
    height: 30px;
    width: 30px;
  }

  .o22 {
    position: absolute;
    border: 25px solid var(--c);
    top: 210;
    left: 210;
    border-radius: 100px;
    height: 30px;
    width: 30px;
  }

  .x00Left {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 45px;
    left: 1px;
    background: var(--e);
    rotate: 45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x00Right {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 45px;
    left: 1px;
    background: var(--e);
    rotate: -45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x01Left {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 45px;
    left: 100px;
    background: var(--e);
    rotate: 45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x01Right {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 45px;
    left: 100px;
    background: var(--e);
    rotate: -45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x02Left {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 45px;
    left: 201px;
    background: var(--e);
    rotate: 45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x02Right {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 45px;
    left: 201px;
    background: var(--e);
    rotate: -45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x10Left {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 145px;
    left: 1px;
    background: var(--e);
    rotate: 45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x10Right {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 145px;
    left: 1px;
    background: var(--e);
    rotate: -45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x11Left {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 145px;
    left: 100px;
    background: var(--e);
    rotate: 45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x11Right {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 145px;
    left: 100px;
    background: var(--e);
    rotate: -45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x12Left {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 145px;
    left: 201px;
    background: var(--e);
    rotate: 45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x12Right {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 145px;
    left: 201px;
    background: var(--e);
    rotate: -45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x20Left {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 245px;
    left: 1px;
    background: var(--e);
    rotate: 45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x20Right {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 245px;
    left: 1px;
    background: var(--e);
    rotate: -45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x21Left {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 245px;
    left: 100px;
    background: var(--e);
    rotate: 45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x21Right {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 245px;
    left: 100px;
    background: var(--e);
    rotate: -45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x22Left {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 245px;
    left: 201px;
    background: var(--e);
    rotate: 45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }

  .x22Right {
    width: 100px;
    position: absolute;
    height: 10px;
    top: 245px;
    left: 201px;
    background: var(--e);
    rotate: -45deg;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
    border-bottom-left-radius: 30px;
    border-bottom-right-radius: 30px;
  }
</style>
