// Entry point for the build script in your package.json

import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails"

// Default of 500ms is too long, reduce so users can see a direct result of their action
Turbo.setProgressBarDelay(300);
// Turbo.session.drive = false // Disable turbo

import "./controllers"
