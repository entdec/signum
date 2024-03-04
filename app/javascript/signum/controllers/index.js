import { application } from "signum/controllers/application"

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("signum/controllers", application)

import NotificationBodyController from "signum/components/notification_body/component_controller";
application.register("signum-notification-body", NotificationBodyController);

import NotificationDrawerController from "signum/components/notification_drawer/component_controller";
application.register("signum-notification-drawer", NotificationDrawerController);

import NotificationDrawerItemController from "signum/components/notification_drawer_item/component_controller";
application.register("signum-notification-drawer-item", NotificationDrawerItemController);
