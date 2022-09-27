describe("User login", () => {
  it("navigates to homepage", () => {
    cy.visit("/");
  });

	it("navigates to Login page", () => {
		cy.get("a").contains("Login").click({ force: true });
    cy.contains("Password")
	});

	it("can login as a registered user", () => {

		// enter email
		cy.get("input[name='email']").type("gandalf@gandalf.com");

		// enter password
		cy.get("input[name='password']").type("gandalf");

		// click on the Submit button
		cy.get("input[name='commit']").click({ force: true });

		// check if the user is logged in
		cy.contains("Signed in as")

		// check that the user is redirected to the homepage
		cy.contains("Looking for a way to add some life to your home?")
	});
  
});
