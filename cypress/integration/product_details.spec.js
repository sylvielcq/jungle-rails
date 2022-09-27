describe("Product details", () => {
  it("navigates to homepage", () => {
    cy.visit("/");
  });


  it("navigates to the product page", () => {
    cy.get('article').first().click();
    cy.url().should('include', '/products/');
  });
  
});