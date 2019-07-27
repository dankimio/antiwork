<template>
  <div id="app">
    <div class="container text-center mb-10">
      <p class="text-gray-600">{{ message }}</p>
    </div>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      message: 'Hello Vue!'
    }
  }
}
</script>

<style scoped>
p {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell,
    'Open Sans', 'Helvetica Neue', sans-serif;
  font-size: 2em;
  text-align: center;
}
</style>
