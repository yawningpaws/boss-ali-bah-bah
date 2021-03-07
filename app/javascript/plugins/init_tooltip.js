
const initTooltip = () => {
  const tooltip = $('[data-toggle="tooltip"]');

  if (tooltip) {
    $(function () {
      tooltip.tooltip()
    })
  }
};

export { initTooltip };
