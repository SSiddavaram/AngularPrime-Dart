/**
 * (C) 2014 Stephan Rauh http://www.beyondjava.net
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
library puiInput;

import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angularprime_dart/core/pui-base-component.dart';

/**
 * <pui-input> adds AngularDart to an input field styled by PrimeFaces.
 */
@NgComponent(
    selector: 'pui-input',
    templateUrl: 'packages/angularprime_dart/puiInput/pui-input.html',
    cssUrl: 'packages/angularprime_dart/puiInput/pui-input.css',
    publishAs: 'cmp'
)
class PuiInputTextComponent extends PuiBaseComponent implements NgShadowRootAware  {
  /** The <pui-input> field as defined in the HTML source code. */ 
  Element puiInputElement;
 
  /** The <input> field in the shadow DOM displaying the component. */
  InputElement shadowyInputField;
  
  /** <pui-input> fields require an ng-model attribute. */
  @NgTwoWay("ng-model")
  String ngmodel;
  
  /** The scope is needed to add watches. */
  Scope scope;
  
  /**
   * Initializes the component by setting the <pui-input> field and setting the scope.
   */
  PuiInputTextComponent(this.scope, this.puiInputElement) {
  }

  /**
   * Make the global CSS styles available to the shadow DOM, copy the user-defined attributes from
   * the HTML source code into the shadow DOM and see to it that model updates result in updates of the shadow DOM.
   * 
   * @Todo Find out, which attributes are modified by Angular, and set a watch updating only the attributes that have changed. 
   */
  void onShadowRoot(ShadowRoot shadowRoot) {
    shadowRoot.applyAuthorStyles = true;
    shadowyInputField = shadowRoot.getElementsByTagName("input")[0];
    copyAttributesToShadowDOM(puiInputElement, shadowyInputField, scope);
    shadowyInputField.onKeyUp.listen((KeyboardEvent e)=>updateAttributesInShadowDOM(puiInputElement, shadowyInputField, scope));
  }
}

