document.addEventListener('turbo:load', (event) => {
  console.log("Controller connected.");

  const targetElement = document.querySelector('[data-target="target"]');
  if (targetElement) {
    targetElement.style.display = 'none';
  }

  const toggleButton = document.querySelector('[data-action="click->toggle"]');
  if (toggleButton) {
    toggleButton.addEventListener('click', () => {
      if (targetElement) {
        const style = targetElement.style;
        style.display = style.display === 'none' ? 'block' : 'none';
      }
    });
  }
});