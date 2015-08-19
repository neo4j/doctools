/**
 * Licensed to Neo Technology under one or more contributor
 * license agreements. See the NOTICE file distributed with
 * this work for additional information regarding copyright
 * ownership. Neo Technology licenses this file to you under
 * the Apache License, Version 2.0 (the "License"); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

function initToc()
{
  var HIDDEN_CLASS = 'hidden-section-toc';
  var VISIBLE_CLASS = 'visible-section-toc';
  var $pageContent = $( '#content' );
  var $wrapper = $( 'div.toc', $pageContent );

  if ( $wrapper.length === 0 )
  {
    return;
  }
  var totalItems = $( 'li', $wrapper ).length;

  var $outerList = $( 'ul.toc', $wrapper );
  var hasInnerList = $( 'ul', $outerList ).length > 0;

  var $heading = $( 'p', $wrapper );
  if ( $heading.length === 0 )
  {
    $heading = $( '<p/>' ).prependTo( $wrapper );
  }

  var $hideButton = $( '<label class="btn btn-default btn-xs" title="Hide table of contents"><input type="radio" name="tocState" autocomplete="off">Hidden</label>' ).click(function(){
    $wrapper.addClass( HIDDEN_CLASS ).removeClass( VISIBLE_CLASS );
  });
  var $showButton = $( '<label class="btn btn-default btn-xs" title="Show table of contents"><input type="radio" name="tocState" autocomplete="off">Normal</label>' ).click(function(){
    $wrapper.addClass( VISIBLE_CLASS ).removeClass( HIDDEN_CLASS );
  });
  var $detailButton = $( '<label class="btn btn-default btn-xs" title="Show detailed table of contents"><input type="radio" name="tocState" autocomplete="off">Extended</label>' ).click(function(){
    if ( hasInnerList )
    {
      $wrapper.removeClass( VISIBLE_CLASS ).removeClass( HIDDEN_CLASS );
    }
    else
    {
      return false;
    }
  });

  if ( hasInnerList && totalItems < 8 )
  {
    $detailButton.addClass( "active" )
    $detailButton.children().prop( "checked", true );
    $wrapper.removeClass( VISIBLE_CLASS ).removeClass( HIDDEN_CLASS );
  }
  else
  {
    $showButton.addClass( "active" )
    $showButton.children().prop( "checked", true );
    $wrapper.addClass( VISIBLE_CLASS ).removeClass( HIDDEN_CLASS );
  }

  if ( !hasInnerList )
  {
    $detailButton.addClass( "disabled" );
    $detailButton.children().prop( "disabled", true );
  }

  var $buttons = $( '<div class="btn-group" data-toggle="buttons"></div>' )
    .append( $hideButton )
    .append( $showButton )
    .append( $detailButton );

  $heading.append( $buttons );
}

$( document ).ready( initToc );


