// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "@hotwired/turbo-rails"
import "controllers"

// Removes class .highlight from all elements
//   after a delay (1000ms == 1s)
// This will fade away the highlighting ("yellow") background from the "highlighted" elements
// Usage: Simply add .highlight in rendered html, this will automatically flash and fade the highlight
function removeAllHighlights() {
  const delay_in_ms = 1000
  const flashMessageEls = document.querySelectorAll(".highlight");
  console.debug("in removeAllHighlights:", {delay: delay_in_ms, els: flashMessageEls})
  flashMessageEls.forEach((element) => {
    setTimeout(removeHighlight, delay_in_ms, element);
  });
}

// Removes .highlight from element
// This will fade away the highlighting ("yellow") background from the "highlighted" element
// This manages/assigns the transition. You do NOT need to add transition to CSS.
function removeHighlight(element) {
  const transition_duration = "3s"
  const transition = `${transition_duration} linear background-color`
  console.debug("Removing 'highlight':", { transition: transition, from: element});
  element.style.transition = transition;
  element.classList.remove("highlight");
}
 
window.addEventListener("turbo:load", removeAllHighlights);
