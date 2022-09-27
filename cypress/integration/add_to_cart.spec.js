describe("Add To Cart", () => {
  it("navigates to homepage", () => {
    cy.visit("/");
  });

  it("adds an item to the cart", () => {
    cy.get('button').contains('Add').first().click({force: true});
    cy.contains("My Cart").should("include.text", "1")
  })

});