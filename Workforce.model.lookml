- connection: onemodel_redshift

- scoping: true           # for backward compatibility
- include: "*.view"       # include all views in this project
- include: "*.dashboard"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# - base_view: order_items
#   joins:
#     - join: orders
#       foreign_key: order_id
#     - join: users
#       foreign_key: orders.user_id
